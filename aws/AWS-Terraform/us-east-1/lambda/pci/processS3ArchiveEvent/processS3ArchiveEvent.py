#######
## Author - Pavan Veerla
## User Id - PCHARAN
## Purpose - This lambda function will be triggered with S3 access logs information by SNS for ARCHIVE Functionality  
#######

from __future__ import print_function
import json
import boto3
import logging
import datetime
import gzip
import urllib
import re
import os
import traceback

logger = logging.getLogger()
logger.setLevel(logging.INFO)


## global
client = boto3.client('sts')
sqs_client = boto3.client('sqs')
sns_client = boto3.client('sns')
s3_client = boto3.client('s3')
sqs_url = os.environ['sqs_url']
sns_topic= os.environ['sns_topic']
sns_subject = os.environ['sns_subject']

## IAM role for accessing access logs bucket of customer communication bucket
fmg_cuscomm_s3access_role = os.environ['fmg_cuscomm_s3access_role']
## access logs bucket of ins bucket
fmg_ins_s3access_logs_bucket = os.environ['fmg_ins_s3access_logs_bucket']
## access logs bucket of customer communication bucket
fmg_cuscomm_s3access_logs_bucket = os.environ['fmg_cuscomm_s3access_logs_bucket']

response = client.assume_role(RoleArn=fmg_cuscomm_s3access_role,RoleSessionName='processS3ArchiveEvent-lambda')
credentials = response['Credentials']
s3_sts_client = boto3.client('s3',
                            aws_access_key_id = credentials['AccessKeyId'],
                            aws_secret_access_key = credentials['SecretAccessKey'],
                            aws_session_token = credentials['SessionToken'])  
      
          
## start here
def lambda_handler(event, context):
    try:
        records = event['Records']
        for rec in records:
            event = json.loads(rec['Sns']['Message'])
            s3Bucket = event['Records'][0]['s3']['bucket']['name']
            s3ObjectKey = event['Records'][0]['s3']['object']['key']
            logger.info("Bucket: "+s3Bucket+ "  Object Key: "+s3ObjectKey)
            ### Getting the info from which account the s3 invokation and using respective role names
            ### stage s3 bucket
            if (s3Bucket == fmg_ins_s3access_logs_bucket):
                response = s3_client.get_object(Bucket=s3Bucket, Key=s3ObjectKey)
                body = response['Body'].read()
                lines = body.splitlines()
                s3AccessLogsGlacierTransition(lines,s3Bucket,s3ObjectKey)  
                
            ### for customer communication s3 access logs bucket present in franklin prod aws account
            elif (s3Bucket == fmg_cuscomm_s3access_logs_bucket):
                response = s3_sts_client.get_object(Bucket=s3Bucket, Key= s3ObjectKey)
                body = response['Body'].read()
                lines = body.splitlines()
                s3AccessLogsGlacierTransition(lines,s3Bucket,s3ObjectKey)
                  
    except Exception as e:
        logger.info("Exception occured when sending transaction to SQS")
        errorMessage= str(e)
        logger.info(errorMessage)
        send_sns_notification(errorMessage)

## this function will send arcchived s3 bucket and object key info to SQS queue
def s3AccessLogsGlacierTransition(lines,s3Bucket,s3ObjectKey):
    try:

        for line in lines:
            line = line.decode("utf-8")
            regex = '(?:"([^"]+)")|(?:\[([^\]]+)\])|([^ ]+)'
            data = re.compile(regex).findall(line)
            
            jsondata={}
            jsondata['operation'] = data[6][0] or data[6][1] or data[6][2]

            if(jsondata['operation'] == 'S3.TRANSITION.OBJECT'):
                logger.info(jsondata['operation'])
                jsondata['key'] = data[7][0] or data[7][1] or data[7][2]
                jsondata['bucket'] = data[1][0] or data[1][1] or data[1][2]
                
                logger.info("Sending archived object information to SQS.")                
                ## sending transition event info to SQS
                sqs_response = sqs_client.send_message(
                    QueueUrl=sqs_url,
                    MessageBody=str(jsondata))            
                logger.info("Sent Archived object infor to SQS successfully.")


    except Exception as e:
        logger.info("Exception occured when sending transaction to SQS")
        errorMessage= str(e)
        logger.info(errorMessage)
        send_sns_notification(errorMessage)
        
        
def send_sns_notification(errorMessage):
    sns_response = sns_client.publish(        
            TopicArn=sns_topic,
            Message=errorMessage,
            Subject= sns_subject
        )
    logger.info("Sent SNS Notification")