from datetime import datetime, timedelta
from elasticsearch import Elasticsearch
import boto3

# To check the elasticsearch index for last 10 minutes
date_range = "now-10m"

# Set the threshold, if the string apprears more than threshold then only alert will be sent
threshold = 1

# Define SNS clinet
client = boto3.client('sns')

# Connect to ElasticSearch to query
es = Elasticsearch(
    ['http://10.153.10.20:9200'],
    basic_auth=('ELASTIC_USERNAME', 'ELASTIC_PASSWORD')
)

message = ''

# looking for string ins_middletier_exception_nonprod@franklin-madison.com in the filebeat logs
res1 = es.count(index="filebeat-*", query={"bool": {"must": [{"query_string": {"query": "message:\"ins_middletier_exception_nonprod@franklin-madison.com\""}},{"range": {"@timestamp": {"gte": date_range}}}]}})

# if the count of string ins_middletier_exception_nonprod@franklin-madison.com is more than threshold, then add details to message 
if res1['count'] > threshold:
    message = message + "We had " + str(res1['count']) + " occurence of \"ins_middletier_exception_nonprod@franklin-madison.com\" in last 10 minutes"+'\n'

# looking for string ins_middletier_exception_prod@franklin-madison.com in the filebeat logs
res2 = es.count(index="filebeat-*", query={"bool": {"must": [{"query_string": {"query": "message:\"ins_middletier_exception_prod@franklin-madison.com\""}},{"range": {"@timestamp": {"gte": date_range}}}]}})

# if the count of string ins_middletier_exception_prod@franklin-madison.com is more than threshold, then add details to message 
if res2['count'] > threshold:
    message = message + "We had " + str(res2['count']) + " occurence of \"ins_middletier_exception_prod@franklin-madison.com\" in last 10 minutes"+'\n'

# looking for string Exception in the filebeat logs
res3 = es.count(index="filebeat-*", query={"bool": {"must": [{"query_string": {"query": "message:\"Exception\""}},{"range": {"@timestamp": {"gte": date_range}}}]}})

# if the count of string Exception is more than threshold, then add details to message 
if res3['count'] > threshold:
    message = message + "We had " + str(res3['count']) + " occurence of \"Exception\" in last 10 minutes"+'\n'

# looking for string Sending email to in the filebeat logs
res4 = es.count(index="filebeat-*", query={"bool": {"must": [{"query_string": {"query": "message:\"Sending email to\""}},{"range": {"@timestamp": {"gte": date_range}}}]}})

# if the count of string Sending email to is more than threshold, then add details to message 
if res4['count'] > threshold:
    message = message + "We had " + str(res4['count']) + " occurence of \"Sending email to\" in last 10 minutes"+'\n'

# looking for string Caused by in the filebeat logs
res5 = es.count(index="filebeat-*", query={"bool": {"must": [{"query_string": {"query": "message:\"Caused by\""}},{"range": {"@timestamp": {"gte": date_range}}}]}})

# if the count of string Caused by is more than threshold, then add details to message 
if res5['count'] > threshold:
    message = message + "We had " + str(res5['count']) + " occurence of \"Caused by\" in last 10 minutes"+'\n'

# looking for string Files_in_Error_Folder in the filebeat logs
res6 = es.count(index="filebeat-*", query={"bool": {"must": [{"query_string": {"query": "message:\"Files_in_Error_Folder\""}},{"range": {"@timestamp": {"gte": date_range}}}]}})

# if the count of string Files_in_Error_Folder is more than threshold, then add details to message 
if res6['count'] > threshold:
    message = message + "We had " + str(res3['count']) + " occurence of \"Files_in_Error_Folder\" in last 10 minutes"+'\n'

# Send message via SNS
if message != '':
    intro = "Hello Team," + '\n' + '\n' + "We have alert from log monitoring system, please check"+'\n'
    intro = intro +'\n'+'-----------------------------------------------------------------------------'+'\n'
    intro = intro + message
    intro = intro +'-----------------------------------------------------------------------------'
    print(intro)
    response = client.publish (TargetArn = "arn:aws:sns:us-east-1:964190570136:kibana-alert-topic-temp",Message = intro)

