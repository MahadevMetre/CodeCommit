pipe_name               = "digital-customer-service-queue-qa"
role_name               = "digital-customer-service-queue-role"
source_arn              = "arn:aws:sqs:us-east-1:634621569833:digital_customer_service_incoming_queue_qa.fifo"
target_arn              = "arn:aws:execute-api:us-east-1:634621569833:8vm3fv6g0e/qa/POST/customerServiceQueue"
batch_size              = 1
region                  = "us-east-1"
api_id                  = "8vm3fv6g0e"
stage                   = "qa"
api_path                = "customerServiceQueue"
http_method             = "POST"
source_queue_name       = "digital_customer_service_incoming_queue_qa.fifo"
api_gateway_policy_name = "digital-api-service-policy"
sqs_policy_name         = "digital-sqs-service-policy"

input_template       = <<EOF
{
  "eventSourceARN": "<$.eventSourceARN>",
  "eventName": "<$.eventName>",
  "approximateArrivalTimestamp": "<$.approximateArrivalTimestamp>",
  "sequenceNumber": "<$.sequenceNumber>",
  "partitionKey": "<$.partitionKey>",
  "kinesisSchemaVersion": "<$.kinesisSchemaVersion>",
  "awsRegion": "<$.awsRegion>",
  "body": "<$.body>",
  "messageId": "<$.messageId>",
  "eventSource": "<$.eventSource>"
}
EOF
cloudwatch_logs_enabled   = true
log_level                 = "ERROR"
retention_in_days         = 0

tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08242024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08242024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}