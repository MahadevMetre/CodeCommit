import boto3
import json
import os
import random
import string 
from datetime import datetime
log_time = (datetime.now().strftime('%Y_%m_%d_%H_%M_%S_'))


def lambda_handler(event, context):
    try:
        letters = string.ascii_letters
        log_prefix = ''.join(random.choice(letters) for i in range(10)) 
        #if project name sent in the payload, consider project name else create under common folder.
        if 'project' in event:
            project = event["project"]
            if not project:
                project = 'common'
        else:
            project = 'common'
        #if log exists in the payload, write log else return no log found message.
        if 'log' in event:
            log = event["log"]
            bucket_name = os.environ.get('bucket_name')
            file_name = log_time+log_prefix+".txt"
            s3_path = project + "/" + file_name
            s3 = boto3.resource("s3")
            s3.Bucket(bucket_name).put_object(Key=s3_path, Body=json.dumps(log))
            return json.dumps('Log uploaded successfully!')
        else:
            return 'payload does not have any log to write!'
    except(ValueError, TypeError):
        return ValueError