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
#from exceptions import *

logger = logging.getLogger()
logger.setLevel(logging.INFO)


## global
sqs_client = boto3.client('sqs')
s3_client = boto3.client('s3')
sqs_url = os.environ['sqs_url']

def lambda_handler(event, context):
    try:
        records = event['Records']
        for rec in records:
            event = json.loads(rec['Sns']['Message'])
            s3Bucket = event['Records'][0]['s3']['bucket']['name']
            s3ObjectKey = event['Records'][0]['s3']['object']['key']
            response = s3_client.get_object(Bucket=s3Bucket, Key=s3ObjectKey)
            body = response['Body'].read()
            lines = body.splitlines()
            s3AccessLogsGlacierTransition(lines)        
                
    except Exception as e:
        logger.info(e)  

def s3AccessLogsGlacierTransition(lines):
    try:
        for line in lines:
            line = line.decode("utf-8")
            regex = '(?:"([^"]+)")|(?:\[([^\]]+)\])|([^ ]+)'
            data = re.compile(regex).findall(line)
            
            jsondata={}
            jsondata['operation'] = data[6][0] or data[6][1] or data[6][2]
            logger.info(jsondata['operation'])
            if(jsondata['operation'] == 'S3.TRANSITION.OBJECT'):
                logger.info(jsondata['operation'])
                jsondata['key'] = data[7][0] or data[7][1] or data[7][2]
                jsondata['bucket'] = data[1][0] or data[1][1] or data[1][2]
                logger.info(jsondata)
                
                ## sending transition event info to SQS
                sqs_response = sqs_client.send_message(
                    QueueUrl=sqs_url,
                    MessageBody=str(jsondata))            
                logger.info(sqs_response)
    except Exception as e:
        logger.info(e)