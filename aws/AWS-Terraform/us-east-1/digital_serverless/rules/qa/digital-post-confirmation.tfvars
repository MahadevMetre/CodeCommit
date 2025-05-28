schedule_expression         = "rate(3 minutes)"
target_id                   = "post-confirmation-queue-target"

api_destination_name        = "digital-post-confirmation-queue-api-qa"
api_destination_endpoint    = "https://8vm3fv6g0e.execute-api.us-east-1.amazonaws.com/qa/postConfirmationQueue"
connection_name             = "digital-post-confirmation-queue"

event_rule_name             = "digital-post-confirmation-queue-scheduler-qa"
event_pattern               = "{\"source\": [\"aws.s3\"]}"
description                 = "API Destination Connection for EventBridge Rule: Post Confirmation Queue Scheduler"
target_arn                  = "arn:aws:events:us-east-1:634621569833:api-destination/digital-post-confirmation-queue-api-qa/bc66608a-8199-402e-bf85-01b1597bcb95"

username  = "digital-user"
password  = "DUMMY VALUE"
invocation_http_parameters = {}

rule_tags = {
  "ApplicationName"       = "Digital"
  "Automated"             = "True"
  "BackupPlan"            = "None"
  "CostCenter"            = "FMG"
  "CreatedBy"             = "DevOps"
  "CreatedOn"             = "08292024"
  "DataClassification"    = "Low"
  "Department"            = "DGT"
  "Infrastructure"        = "False"
  "LastUpdated"           = "08292024"
  "TechStack"             = "AWS"
  "Usage"                 = "Project"
  "Version"               = "1.0"
}


dlq_arn  = "arn:aws:sqs:us-east-1:634621569833:digital-serverless-dlq-qa"
role_arn = "arn:aws:iam::634621569833:role/digital-ecs-task-execution-role-qa"
is_enabled = true