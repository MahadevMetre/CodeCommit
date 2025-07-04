#####################################################################################################################
# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.                                           #
#                                                                                                                   #
# Licensed under the Amazon Software License (the "License"). You may not use this file except in compliance        #
# with the License. A copy of the License is located at                                                             #
#                                                                                                                   #
#     http://aws.amazon.com/asl/                                                                                    #
#                                                                                                                   #
# or in the "license" file accompanying this file. This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES #
# OR CONDITIONS OF ANY KIND, express or implied. See the License for the specific language governing permissions    #
# and limitations under the License.                                                                                #
#####################################################################################################################

import boto3
import json
import logging
import math
import time
import datetime
import gzip
from urllib.parse import unquote_plus
from urllib.request import Request, urlopen
from os import environ
from ipaddress import ip_address
from base64 import b64decode

logging.getLogger().debug('Loading function')

#======================================================================================================================
# Constants
#======================================================================================================================
API_CALL_NUM_RETRIES = 3
BLOCK_ERROR_CODES = ['400','403','404','405'] # error codes to parse logs for

STACK_NAME_encrypted = environ['STACK_NAME']
STACK_NAME = boto3.client('kms').decrypt(CiphertextBlob=b64decode(STACK_NAME_encrypted))['Plaintext'].decode('utf-8')



OUTPUT_FILE_NAME = STACK_NAME + '.json'

LOG_TYPE_encrypted = environ['LOG_TYPE']
LOG_TYPE = boto3.client('kms').decrypt(CiphertextBlob=b64decode(LOG_TYPE_encrypted))['Plaintext'].decode('utf-8')

OUTPUT_BUCKET_encrypted = environ['OUTPUT_BUCKET']
OUTPUT_BUCKET = boto3.client('kms').decrypt(CiphertextBlob=b64decode(OUTPUT_BUCKET_encrypted))['Plaintext'].decode('utf-8')

BLACKLIST_BLOCK_PERIOD_encrypted = environ['BLACKLIST_BLOCK_PERIOD']
BLACKLIST_BLOCK_PERIOD = boto3.client('kms').decrypt(CiphertextBlob=b64decode(BLACKLIST_BLOCK_PERIOD_encrypted))['Plaintext'].decode('utf-8')

MAX_AGE_TO_UPDATE_encrypted = environ['MAX_AGE_TO_UPDATE']
MAX_AGE_TO_UPDATE = boto3.client('kms').decrypt(CiphertextBlob=b64decode(MAX_AGE_TO_UPDATE_encrypted))['Plaintext'].decode('utf-8')

IP_SET_ID_BLACKLIST_encrypted = environ['IP_SET_ID_BLACKLIST']
IP_SET_ID_BLACKLIST = boto3.client('kms').decrypt(CiphertextBlob=b64decode(IP_SET_ID_BLACKLIST_encrypted))['Plaintext'].decode('utf-8')

LIMIT_IP_ADDRESS_RANGES_PER_IP_MATCH_CONDITION_encrypted = environ['LIMIT_IP_ADDRESS_RANGES_PER_IP_MATCH_CONDITION']
LIMIT_IP_ADDRESS_RANGES_PER_IP_MATCH_CONDITION = boto3.client('kms').decrypt(CiphertextBlob=b64decode(LIMIT_IP_ADDRESS_RANGES_PER_IP_MATCH_CONDITION_encrypted))['Plaintext'].decode('utf-8')

SEND_ANONYMOUS_USAGE_DATA_encrypted = environ['SEND_ANONYMOUS_USAGE_DATA']
SEND_ANONYMOUS_USAGE_DATA = boto3.client('kms').decrypt(CiphertextBlob=b64decode(SEND_ANONYMOUS_USAGE_DATA_encrypted))['Plaintext'].decode('utf-8')

IP_SET_ID_AUTO_BLOCK_encrypted = environ['IP_SET_ID_AUTO_BLOCK']
IP_SET_ID_AUTO_BLOCK = boto3.client('kms').decrypt(CiphertextBlob=b64decode(IP_SET_ID_AUTO_BLOCK_encrypted))['Plaintext'].decode('utf-8')

METRIC_NAME_PREFIX_encrypted = environ['METRIC_NAME_PREFIX']
METRIC_NAME_PREFIX = boto3.client('kms').decrypt(CiphertextBlob=b64decode(METRIC_NAME_PREFIX_encrypted))['Plaintext'].decode('utf-8')

UUID_encrypted = environ['UUID']
UUID = boto3.client('kms').decrypt(CiphertextBlob=b64decode(UUID_encrypted))['Plaintext'].decode('utf-8')

LOG_LEVEL_encrypted = environ['LOG_LEVEL']
LOG_LEVEL = boto3.client('kms').decrypt(CiphertextBlob=b64decode(LOG_LEVEL_encrypted))['Plaintext'].decode('utf-8')


REGION_encrypted = environ['REGION']
REGION = boto3.client('kms').decrypt(CiphertextBlob=b64decode(REGION_encrypted))['Plaintext'].decode('utf-8')





# CloudFront Access Logs
# http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/AccessLogs.html#BasicDistributionFileFormat
LINE_FORMAT_CLOUD_FRONT = {
    'delimiter': '\t',
    'date': 0,
    'time' : 1,
    'source_ip' : 4,
    'code' : 8
}
# ALB Access Logs
# http://docs.aws.amazon.com/elasticloadbalancing/latest/application/load-balancer-access-logs.html
LINE_FORMAT_ALB = {
    'delimiter': ' ',
    'timestamp': 1,
    'source_ip' : 3,
    'code' : 9 # GitHub issue #44. Changed from elb_status_code to target_status_code.
}

REQUEST_COUNTER_INDEX = 0
ERROR_COUNTER_INDEX = 1

waf = None

#======================================================================================================================
# Auxiliary Functions
#======================================================================================================================
def get_outstanding_requesters(bucket_name, key_name):
    logging.getLogger().debug('[get_outstanding_requesters] Start')

    outstanding_requesters = {}
    outstanding_requesters['block'] = {}
    result = {}
    num_requests = 0
    try:
        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[get_outstanding_requesters] \tDownload file from S3")
        #--------------------------------------------------------------------------------------------------------------
        local_file_path = '/tmp/' + key_name.split('/')[-1]
        s3 = boto3.client('s3')
        s3.download_file(bucket_name, key_name, local_file_path)

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[get_outstanding_requesters] \tRead file content")
        #--------------------------------------------------------------------------------------------------------------
        with gzip.open(local_file_path,'r') as content:
            for line in content:
                try:
                    line = line.decode('utf8')
                    if line.startswith('#'):
                        continue

                    return_code_index = None
                    if LOG_TYPE == 'cloudfront':
                        line_data = line.split(LINE_FORMAT_CLOUD_FRONT['delimiter'])
                        request_key = line_data[LINE_FORMAT_CLOUD_FRONT['date']]
                        request_key += '-' + line_data[LINE_FORMAT_CLOUD_FRONT['time']][:-3]
                        request_key += '-' + line_data[LINE_FORMAT_CLOUD_FRONT['source_ip']]
                        return_code_index = LINE_FORMAT_CLOUD_FRONT['code']
                    elif LOG_TYPE == 'alb':
                        line_data = line.split(LINE_FORMAT_ALB['delimiter'])
                        request_key = line_data[LINE_FORMAT_ALB['timestamp']].rsplit(':', 1)[0]
                        request_key += '-' + line_data[LINE_FORMAT_ALB['source_ip']].rsplit(':', 1)[0]
                        return_code_index = LINE_FORMAT_ALB['code']
                    else:
                        return outstanding_requesters, num_requests

                    if request_key in result.keys():
                        result[request_key][REQUEST_COUNTER_INDEX] += 1
                    else:
                        result[request_key] = [1,0]

                    if line_data[return_code_index] in BLOCK_ERROR_CODES:
                        result[request_key][ERROR_COUNTER_INDEX] += 1

                    num_requests += 1

                except Exception as e:
                    logging.getLogger().error("[get_outstanding_requesters] \t\tError to process line: %s"%line)

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[get_outstanding_requesters] \tKeep only outstanding requesters")
        #--------------------------------------------------------------------------------------------------------------
        now_timestamp_str = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        for k, v in result.items():
            k = k.split('-')[-1]
            error_exceeded = ('ERROR_PER_MINUTE_LIMIT' in environ and int(environ['ERROR_PER_MINUTE_LIMIT']) >= 0 and v[ERROR_COUNTER_INDEX] > int(environ['ERROR_PER_MINUTE_LIMIT']))
            req_exceeded = ('REQUEST_PER_MINUTE_LIMIT' in environ and int(environ['REQUEST_PER_MINUTE_LIMIT']) >= 0 and v[REQUEST_COUNTER_INDEX] > int(environ['REQUEST_PER_MINUTE_LIMIT']))

            if req_exceeded or error_exceeded:
                if k not in outstanding_requesters['block'].keys() or (
                        outstanding_requesters['block'][k]['max_req_per_min'] < v[REQUEST_COUNTER_INDEX] or
                        outstanding_requesters['block'][k]['max_err_per_min'] < v[ERROR_COUNTER_INDEX]
                    ):
                    outstanding_requesters['block'][k] = {
                        'max_req_per_min': v[REQUEST_COUNTER_INDEX],
                        'max_err_per_min': v[ERROR_COUNTER_INDEX],
                        'updated_at': now_timestamp_str
                    }

    except Exception as e:
        logging.getLogger().error("[get_outstanding_requesters] \tError to read input file")

    logging.getLogger().debug('[get_outstanding_requesters] End')
    return outstanding_requesters, num_requests

def merge_current_blocked_requesters(key_name, outstanding_requesters):
    logging.getLogger().debug('[merge_current_blocked_requesters] Start')

    response = None
    expired = False
    last_update_age = 0
    remote_outstanding_requesters = {}
    s3 = boto3.client('s3')

    #--------------------------------------------------------------------------------------------------------------
    logging.getLogger().info("[merge_current_blocked_requesters] \tCalculate Last Update Age")
    #--------------------------------------------------------------------------------------------------------------
    try:
        response = s3.head_object(Bucket=OUTPUT_BUCKET, Key=OUTPUT_FILE_NAME)
    except Exception as e:
        logging.getLogger().info('[merge_current_blocked_requesters] No file to be merged.')
        return outstanding_requesters, True

    now_timestamp = datetime.datetime.now(response['LastModified'].tzinfo)
    now_timestamp_str = now_timestamp.strftime("%Y-%m-%d %H:%M:%S")
    last_update_age = int(((now_timestamp - response['LastModified']).total_seconds())/60)

    #--------------------------------------------------------------------------------------------------------------
    logging.getLogger().info("[merge_current_blocked_requesters] \tDownload current blocked IPs")
    #--------------------------------------------------------------------------------------------------------------
    local_file_path = '/tmp/' + key_name.split('/')[-1] + '_REMOTE.json'
    s3.download_file(OUTPUT_BUCKET, OUTPUT_FILE_NAME, local_file_path)

    #----------------------------------------------------------------------------------------------------------
    logging.getLogger().info("[merge_current_blocked_requesters] \tProcess outstanding requesters files")
    #----------------------------------------------------------------------------------------------------------
    with open(local_file_path, 'r') as file_content:
        remote_outstanding_requesters = json.loads(file_content.read())

    for k, v in remote_outstanding_requesters['block'].items():
        try:
            error_exceeded = ('ERROR_PER_MINUTE_LIMIT' in environ and int(environ['ERROR_PER_MINUTE_LIMIT']) >= 0 and v['max_err_per_min'] > int(environ['ERROR_PER_MINUTE_LIMIT']))
            req_exceeded = ('REQUEST_PER_MINUTE_LIMIT' in environ and int(environ['REQUEST_PER_MINUTE_LIMIT']) >= 0 and v['max_req_per_min'] > int(environ['REQUEST_PER_MINUTE_LIMIT']))

            if req_exceeded or error_exceeded:
                if k in outstanding_requesters['block'].keys():
                    logging.getLogger().info("[merge_current_blocked_requesters] \t\tUpdating data of BLOCK %s rule"%k)
                    outstanding_requesters['block'][k]['updated_at'] = now_timestamp_str
                    if v['max_req_per_min'] > outstanding_requesters['block'][k]['max_req_per_min']:
                        outstanding_requesters['block'][k]['max_req_per_min'] = v['max_req_per_min']
                    if v['max_err_per_min'] > outstanding_requesters['block'][k]['max_err_per_min']:
                        outstanding_requesters['block'][k]['max_err_per_min'] = v['max_err_per_min']

                else:
                    prev_updated_at = datetime.datetime.strptime(v['updated_at'], "%Y-%m-%d %H:%M:%S")
                    prev_updated_at = prev_updated_at.replace(tzinfo=response['LastModified'].tzinfo)
                    total_diff_min = ((now_timestamp - prev_updated_at).total_seconds())/60
                    if total_diff_min < int(BLACKLIST_BLOCK_PERIOD):
                        logging.getLogger().debug("[merge_current_blocked_requesters] \t\tKeeping %s"%k)
                        outstanding_requesters['block'][k] = v
                    else:
                        expired = True
                        logging.getLogger().debug("[merge_current_blocked_requesters] \t\t%s expired"%k)

        except Exception as e:
            logging.getLogger().error("[merge_current_blocked_requesters] \tError merging %s rule"%k)
            logging.getLogger().error(e)

    need_update = (expired or last_update_age > int(MAX_AGE_TO_UPDATE) or len(outstanding_requesters['block']) > 0)

    logging.getLogger().debug('[merge_current_blocked_requesters] End')
    return outstanding_requesters, need_update

def write_output(key_name, outstanding_requesters):
    logging.getLogger().debug('[write_output] Start')

    try:
        current_data = '/tmp/' + key_name.split('/')[-1] + '_LOCAL.json'
        with open(current_data, 'w') as outfile:
            json.dump(outstanding_requesters, outfile)

        s3 = boto3.client('s3')
        s3.upload_file(current_data, OUTPUT_BUCKET, OUTPUT_FILE_NAME, ExtraArgs={'ContentType': "application/json"})

    except Exception as e:
        logging.getLogger().error("[write_output] \tError to write output file")
        logging.getLogger().error(e)

    logging.getLogger().debug('[write_output] End')

def waf_get_ip_set(ip_set_id):
    logging.getLogger().debug('[waf_get_ip_set] Start')
    response = None

    for attempt in range(API_CALL_NUM_RETRIES):
        try:
            response = waf.get_ip_set(IPSetId=ip_set_id)
        except Exception as error:
            logging.getLogger().error(str(error))
            delay = math.pow(2, attempt)
            logging.getLogger().info("[waf_get_ip_set] Retrying in %d seconds..." % (delay))
            time.sleep(delay)
        else:
            break
    else:
        logging.getLogger().error("[waf_get_ip_set] Failed to retrieve ip set '%s'."%ip_set_id)

    logging.getLogger().debug('[waf_get_ip_set] End')
    return response

def waf_update_ip_set(ip_set_id, updates_list):
    logging.getLogger().debug('[waf_update_ip_set] Start')
    response = None

    if updates_list != []:
        for attempt in range(API_CALL_NUM_RETRIES):
            try:
                response = waf.update_ip_set(IPSetId=ip_set_id,
                    ChangeToken=waf.get_change_token()['ChangeToken'],
                    Updates=updates_list)
            except Exception as error:
                logging.getLogger().error(str(error))
                delay = math.pow(2, attempt)
                logging.getLogger().info("[waf_update_ip_set] Retrying in %d seconds..." % (delay))
                time.sleep(delay)
            else:
                break
        else:
            logging.getLogger().error("[waf_update_ip_set] Failed to update ip set '%s'."%ip_set_id)

    logging.getLogger().debug('[waf_update_ip_set] End')
    return response

def get_ip_set_already_blocked():
    logging.getLogger().debug('[get_ip_set_already_blocked] Start')
    ip_set_already_blocked = []

    try:
        if IP_SET_ID_BLACKLIST != None:
            response = waf_get_ip_set(IP_SET_ID_BLACKLIST)
            if response != None:
                for k in response['IPSet']['IPSetDescriptors']:
                    ip_set_already_blocked.append(k['Value'])

    except Exception as error:
        logging.getLogger().error(str(error))
        logging.getLogger().error("[get_ip_set_already_blocked] Failed to get ip sets already blocked")

    logging.getLogger().debug('[get_ip_set_already_blocked] End')
    return ip_set_already_blocked

def is_already_blocked(ip, ip_set):
    logging.getLogger().debug('[is_already_blocked] Start')
    result = False

    for net in ip_set:
        try:
            ipaddr = int(''.join([ '%02x' % int(x) for x in ip.split('.') ]), 16)
            netstr, bits = net.split('/')
            netaddr = int(''.join([ '%02x' % int(x) for x in netstr.split('.') ]), 16)
            mask = (0xffffffff << (32 - int(bits))) & 0xffffffff

            if (ipaddr & mask) == (netaddr & mask):
                result = True
                break

        except Exception as error:
            logging.getLogger().debug(str(error))

    logging.getLogger().debug('[is_already_blocked] End')
    return result

def update_waf_ip_set(outstanding_requesters, ip_set_id, ip_set_already_blocked):
    logging.getLogger().debug('[update_waf_ip_set] Start')

    counter = 0
    try:
        if ip_set_id == None:
            logging.getLogger().info("[update_waf_ip_set] Ignore process when ip_set_id is None")
            return

        updates_list = []

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[update_waf_ip_set] \tTruncate [if necessary] list to respect WAF limit")
        #--------------------------------------------------------------------------------------------------------------
        top_outstanding_requesters = {}
        for key, value in sorted(outstanding_requesters.items(), key=lambda kv: kv[1]['max_req_per_min'], reverse=True):
            if counter < int(LIMIT_IP_ADDRESS_RANGES_PER_IP_MATCH_CONDITION):
                if not is_already_blocked(key, ip_set_already_blocked):
                    top_outstanding_requesters[key] = value
                    counter += 1
            else:
                break

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[update_waf_ip_set] \tRemove IPs that are not in current outstanding requesters list")
        #--------------------------------------------------------------------------------------------------------------
        response = waf_get_ip_set(ip_set_id)
        if response != None:
            for k in response['IPSet']['IPSetDescriptors']:
                ip_value = k['Value'].split('/')[0]
                if ip_value not in top_outstanding_requesters.keys():
                    ip_type = "IPV%s"%ip_address(ip_value).version
                    updates_list.append({
                        'Action': 'DELETE',
                        'IPSetDescriptor': {
                            'Type': ip_type,
                            'Value': k['Value']
                        }
                    })
                else:
                    # Dont block an already blocked IP
                    top_outstanding_requesters.pop(ip_value, None)

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[update_waf_ip_set] \tBlock remaining outstanding requesters")
        #--------------------------------------------------------------------------------------------------------------
        for k in top_outstanding_requesters.keys():
            ip_type = "IPV%s"%ip_address(k).version
            ip_class = "32" if ip_type == "IPV4" else "128"
            updates_list.append({
                'Action': 'INSERT',
                'IPSetDescriptor': {
                    'Type': ip_type,
                    'Value': "%s/%s"%(k, ip_class)
                }
            })

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[update_waf_ip_set] \tCommit changes in WAF IP set")
        #--------------------------------------------------------------------------------------------------------------
        response = waf_update_ip_set(ip_set_id, updates_list)

    except Exception as error:
        logging.getLogger().error(str(error))
        logging.getLogger().error("[update_waf_ip_set] Error to update waf ip set")

    logging.getLogger().debug('[update_waf_ip_set] End')
    return counter

def send_anonymous_usage_data():
    if SEND_ANONYMOUS_USAGE_DATA != 'yes':
        return

    try:
        logging.getLogger().debug("[send_anonymous_usage_data] Start")
        auto_block_ip_set_size = 0
        blacklist_set_size = 0
        allowed_requests = 0
        blocked_requests_all = 0
        blocked_requests_auto_block = 0
        blocked_requests_blacklist = 0

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Get Auto Block IP Set Size")
        #--------------------------------------------------------------------------------------------------------------
        response = waf_get_ip_set(IP_SET_ID_AUTO_BLOCK)
        if response != None:
            auto_block_ip_set_size = len(response['IPSet']['IPSetDescriptors'])

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Get Blacklist IP Set Size")
        #--------------------------------------------------------------------------------------------------------------
        response = waf_get_ip_set(IP_SET_ID_BLACKLIST)
        if response != None:
            blacklist_set_size = len(response['IPSet']['IPSetDescriptors'])

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Get Num Allowed Requests")
        #--------------------------------------------------------------------------------------------------------------
        try:
            cw = boto3.client('cloudwatch')
            response = cw.get_metric_statistics(
                MetricName='AllowedRequests',
                Namespace='WAF',
                Statistics=['Sum'],
                Period=12*3600,
                StartTime=datetime.datetime.utcnow() - datetime.timedelta(seconds=12*3600),
                EndTime=datetime.datetime.utcnow(),
                Dimensions=[
                    {
                        "Name": "Rule",
                        "Value": "ALL"
                    },
                    {
                        "Name": "WebACL",
                        "Value": METRIC_NAME_PREFIX + 'MaliciousRequesters'
                    }
                ]
            )
            allowed_requests = response['Datapoints'][0]['Sum']

        except Exception as error:
            logging.getLogger().error("[send_anonymous_usage_data] Error to get Num Allowed Requests")
            logging.getLogger().error(str(error))

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Get Num Blocked Requests - All Rules")
        #--------------------------------------------------------------------------------------------------------------
        try:
            cw = boto3.client('cloudwatch')
            response = cw.get_metric_statistics(
                MetricName='BlockedRequests',
                Namespace='WAF',
                Statistics=['Sum'],
                Period=12*3600,
                StartTime=datetime.datetime.utcnow() - datetime.timedelta(seconds=12*3600),
                EndTime=datetime.datetime.utcnow(),
                Dimensions=[
                    {
                        "Name": "Rule",
                        "Value": "ALL"
                    },
                    {
                        "Name": "WebACL",
                        "Value": METRIC_NAME_PREFIX + 'MaliciousRequesters'
                    }
                ]
            )
            blocked_requests_all = response['Datapoints'][0]['Sum']

        except Exception as error:
            logging.getLogger().error("[send_anonymous_usage_data] Error to get Num Blocked Requests")
            logging.getLogger().error(str(error))

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Get Num Blocked Requests - Auto Block Rule")
        #--------------------------------------------------------------------------------------------------------------
        try:
            cw = boto3.client('cloudwatch')
            response = cw.get_metric_statistics(
                MetricName='BlockedRequests',
                Namespace='WAF',
                Statistics=['Sum'],
                Period=12*3600,
                StartTime=datetime.datetime.utcnow() - datetime.timedelta(seconds=12*3600),
                EndTime=datetime.datetime.utcnow(),
                Dimensions=[
                    {
                        "Name": "Rule",
                        "Value": METRIC_NAME_PREFIX + 'ScannersProbesRule'
                    },
                    {
                        "Name": "WebACL",
                        "Value": METRIC_NAME_PREFIX + 'MaliciousRequesters'
                    }
                ]
            )
            blocked_requests_auto_block = response['Datapoints'][0]['Sum']

        except Exception as error:
            logging.getLogger().error("[send_anonymous_usage_data] Error to get Num Blocked Requests")
            logging.getLogger().error(str(error))

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Get Num Blocked Requests - Blacklist Rule")
        #--------------------------------------------------------------------------------------------------------------
        try:
            cw = boto3.client('cloudwatch')
            response = cw.get_metric_statistics(
                MetricName='BlockedRequests',
                Namespace='WAF',
                Statistics=['Sum'],
                Period=12*3600,
                StartTime=datetime.datetime.utcnow() - datetime.timedelta(seconds=12*3600),
                EndTime=datetime.datetime.utcnow(),
                Dimensions=[
                    {
                        "Name": "Rule",
                        "Value": METRIC_NAME_PREFIX + 'BlacklistRule'
                    },
                    {
                        "Name": "WebACL",
                        "Value": METRIC_NAME_PREFIX + 'MaliciousRequesters'
                    }
                ]
            )
            blocked_requests_blacklist = response['Datapoints'][0]['Sum']

        except Exception as error:
            logging.getLogger().error("[send_anonymous_usage_data] Error to get Num Blocked Requests")
            logging.getLogger().error(str(error))

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[send_anonymous_usage_data] Send Data")
        #--------------------------------------------------------------------------------------------------------------
        time_now = datetime.datetime.utcnow().isoformat()
        time_stamp = str(time_now)
        usage_data = {
          "Solution": "SO0006",
          "UUID": UUID,
          "TimeStamp": time_stamp,
          "Data":
          {
              "data_type" : "http_flood_scanner_probe",
              "blacklist_set_size" : blacklist_set_size,
              "auto_block_ip_set_size" : auto_block_ip_set_size,
              "allowed_requests" : allowed_requests,
              "blocked_requests_all" : blocked_requests_all,
              "blocked_requests_auto_block" : blocked_requests_auto_block,
              "blocked_requests_blacklist" : blocked_requests_blacklist,
              "waf_type" : LOG_TYPE
          }
        }

        url = 'https://metrics.awssolutionsbuilder.com/generic'
        req = Request(url, method='POST', data=bytes(json.dumps(usage_data), encoding='utf8'), headers={'Content-Type': 'application/json'})
        rsp = urlopen(req)
        rspcode = rsp.getcode()
        logging.getLogger().debug('[send_anonymous_usage_data] Response Code: {}'.format(rspcode))
        logging.getLogger().debug("[send_anonymous_usage_data] End")

    except Exception as error:
        logging.getLogger().error("[send_anonymous_usage_data] Failed to Send Data")
        logging.getLogger().error(str(error))

#======================================================================================================================
# Lambda Entry Point
#======================================================================================================================
def lambda_handler(event, context):
    logging.getLogger().debug('[lambda_handler] Start')

    outstanding_requesters = {}

    try:
        #------------------------------------------------------------------
        # Set Log Level
        #------------------------------------------------------------------
        global log_level
        log_level = str(LOG_LEVEL.upper())
        if log_level not in ['DEBUG', 'INFO','WARNING', 'ERROR','CRITICAL']:
            log_level = 'ERROR'
        logging.getLogger().setLevel(log_level)

        #----------------------------------------------------------
        # Read inputs parameters
        #----------------------------------------------------------
        logging.getLogger().info(event)
        bucket_name = event['Records'][0]['s3']['bucket']['name']
        key_name = unquote_plus(event['Records'][0]['s3']['object']['key'])

        if key_name == OUTPUT_FILE_NAME:
            logging.getLogger().info("[lambda_handler] \tIgnore processing output file")
            return

        global waf
        if LOG_TYPE == 'alb':
            session = boto3.session.Session(region_name=REGION)
            waf = session.client('waf-regional')
        else:
            waf = boto3.client('waf')

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[lambda_handler] \tReading input data and get outstanding requesters")
        #--------------------------------------------------------------------------------------------------------------
        outstanding_requesters, num_requests = get_outstanding_requesters(bucket_name, key_name)

        #--------------------------------------------------------------------------------------------------------------
        logging.getLogger().info("[lambda_handler] \tMerge with current blocked requesters")
        #--------------------------------------------------------------------------------------------------------------
        outstanding_requesters, need_update = merge_current_blocked_requesters(key_name, outstanding_requesters)

        if need_update:
            #----------------------------------------------------------------------------------------------------------
            logging.getLogger().info("[lambda_handler] \tUpdate new blocked requesters list to S3")
            #----------------------------------------------------------------------------------------------------------
            write_output(key_name, outstanding_requesters)

            #----------------------------------------------------------------------------------------------------------
            logging.getLogger().info("[lambda_handler] \tUpdate WAF IP Set")
            #----------------------------------------------------------------------------------------------------------
            ip_set_already_blocked = get_ip_set_already_blocked()
            num_blocked = update_waf_ip_set(outstanding_requesters['block'], IP_SET_ID_AUTO_BLOCK, ip_set_already_blocked)

            # send_anonymous_usage_data()

        else:
            #----------------------------------------------------------------------------------------------------------
            logging.getLogger().info("[lambda_handler] \tNo changes identified")
            #----------------------------------------------------------------------------------------------------------

    except Exception as error:
        logging.getLogger().error(str(error))

    logging.getLogger().debug('[lambda_handler] End')
    return outstanding_requesters
