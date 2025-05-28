import json
import boto3
from botocore.exceptions import ClientError
from datetime import datetime
import time
import os

def lambda_handler(event, context):
    # List which holds the type of resource for which email sending should be skipped
    skip_email_resource_types = ['AWS::Config::ResourceCompliance', 'AWS::Backup::RecoveryPoint', 'AWS::EC2::NetworkInterface', \
    'AWS::EC2::VPC', 'AWS::EC2::Subnet', 'AWS::EC2::SecurityGroup', 'AWS::RDS::DBSnapshot', 'AWS::SSM::AssociationCompliance', \
    'AWS::Redshift::ClusterSnapshot', 'AWS::SSM::ManagedInstanceInventory']

    message = event['Records'][0]['Sns']['Message']
    parsed_message = json.loads(message)
    print(message)
    print(parsed_message)
    print(parsed_message.keys())
    if 'configurationItemDiff' in parsed_message.keys():
        aws_config_Action=parsed_message['configurationItemDiff']['changeType']
        aws_resource_Type=parsed_message['configurationItem']['resourceType']
        aws_resource_Id=parsed_message['configurationItem']['resourceId']
        aws_resource_Name=parsed_message['configurationItem']['resourceName']
        awsRegion=parsed_message['configurationItem']['awsRegion']
        timeStamp=parsed_message['configurationItem']['configurationItemCaptureTime']
        timelineURL="https://"+awsRegion+".console.aws.amazon.com/config/home?region="+awsRegion+"#/resources/timeline/configuration?resourceType="+aws_resource_Type+"&resourceId="+aws_resource_Id+"&timestamp="+timeStamp

        # Send or skip email notifications based on the environment variable and resource type value
        blacklist_resource_types = os.environ.get('email_notifications_blacklist')
        if aws_resource_Type in skip_email_resource_types and blacklist_resource_types == "enabled":
            print("Skipping email notification for resource type {}.".format(aws_resource_Type))
        else:
            email_message="The action "+str(aws_config_Action)+" was performed on the resource type "+str(aws_resource_Type)+" with resource id "+str(aws_resource_Id)+" and resource name "+str(aws_resource_Name)+".\n\nFollow the url to review the change\n\n"+timelineURL
            print(email_message)
            send_email(email_message)

        s3client = boto3.client('s3')
        bucket_name = os.environ.get('output_bucket_name')
        current_time = str(time.time()).replace('.', '')
        tmp_filename = current_time+".json"
        tmp_filepath = "/tmp/"+tmp_filename
        with open (tmp_filepath, 'w') as file:
            file.write(message)
        now = datetime.now()
        current_year = now.strftime("%Y")
        current_month = now.strftime("%m")
        current_day = now.strftime("%d")
        output_filename = awsRegion+"/"+current_year+"/"+current_month+"/"+current_day+"/"+aws_resource_Type+"/"+aws_resource_Id+"/"+tmp_filename
        s3client.upload_file(tmp_filepath, bucket_name, output_filename)
    else:
        print("The Key configurationItemDiff is not found.")
    return {
        'statusCode': 200,
        'body': json.dumps('Execution completed')
    }

def send_email(email_message):
    EMAIL_NOTIFICATIONS = os.environ.get('email_notifications')
    if EMAIL_NOTIFICATIONS != "enabled":
        return
    SENDER = os.environ.get('email_sender')
    RECIPIENT = os.environ.get('email_receiver')

    AWS_REGION = "us-east-1"

    ENVIRONMENT = os.environ.get('environment')
    SUBJECT = "AWS Config Notification "+ENVIRONMENT

    # The email body for recipients with non-HTML email clients.
    BODY_TEXT = (email_message)

    # The character encoding for the email.
    CHARSET = "UTF-8"

    # Create a new SES resource and specify a region.
    client = boto3.client('ses',region_name=AWS_REGION)

    # Try to send the email.
    try:
        #Provide the contents of the email.
        response = client.send_email(
            Destination={
                'ToAddresses': [
                    RECIPIENT,
                ],
            },
            Message={
                'Body': {
                    'Text': {
                        'Data': BODY_TEXT
                    },
                },
                'Subject': {
                    'Data': SUBJECT
                },
            },
            Source=SENDER
        )
    # Display an error if something goes wrong.	
    except ClientError as e:
        print(e.response['Error']['Message'])
    else:
        print("Email sent! Message ID:"),
        print(response['MessageId'])