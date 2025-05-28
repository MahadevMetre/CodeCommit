name        = "atlas-serverless-parameters-stage"
description = "Parameter Store for Atlas Service"
type        = "SecureString"
value       = "{
    \"DB_CONNECTION_POOL_WS\":\"200\",
    \"MINIMUM_IDLE\":\"10\",
    \"DRIVER_CLASS_NAME\":\"com.ibm.as400.access.AS400JDBCDriver\",
    \"CONNECTION_TIMEOUT\":\"30000\",
    \"IDLE_TIMEOUT\":\"600000\",
    \"MAX_LIFE_TIME\":\"1800000\",
    \"JDBC_URL_PREFIX\":\"jdbc:as400://\",
    \"CAPTIVA_AWS_SQS_ENDPOINT\":\"https://sqs.us-east-1.amazonaws.com/702230634984/captiva_incoming_stage\",
    \"CAPTIVA_AWS_SQS_ERRORQUEUE_ENDPOINT\":\"https://sqs.us-east-1.amazonaws.com/702230634984/captiva_incoming_error_queue_stage\",
    \"CAPTIVA_AWS_SQS_CRON_EXPRESSION\":\"0 0/5 * * * *\",
    \"S3_RESTORE_AWS_SQS_ENDPOINT\":\"https://sqs.us-east-1.amazonaws.com/702230634984/s3_event_restore_incoming_stage\",
    \"S3_RESTORE_AWS_SQS_ERRORQUEUE_ENDPOINT\":\"https://sqs.us-east-1.amazonaws.com/702230634984/s3_event_restore_incoming_error_queue_stage\",
    \"RESTORE_QUEUE_AWS_SQS_CRON_EXPRESSION\":\"0 0/30 * * * *\",
    \"S3_ARCHIVE_AWS_SQS_ENDPOINT\":\"https://sqs.us-east-1.amazonaws.com/702230634984/s3_event_archive_incoming_stage\",
    \"S3_ARCHIVE_AWS_SQS_ERRORQUEUE_ENDPOINT\":\"https://sqs.us-east-1.amazonaws.com/702230634984/s3_event_archive_incoming_error_queue_stage\",
    \"ARCHIVE_QUEUE_AWS_SQS_CRON_EXPRESSION\":\"0 0/30 * * * *\",
    \"EXCEPTION_EMAIL_FROM\":\"Admin Captiva NonProd <ins_middletier_exception_nonprod@franklin-madison.com>\",
    \"EXCEPTION_EMAIL_TO\":\"ins_middletier_exception_nonprod@franklin-madison.com\"
}"
key_id      = "alias/atlas/kms"
tier        = "Standard"
tags = {
    "ApplicationName" = "Atlas2.0"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "07092024"
    "DataClassification" = "Low"
    "Department" = "ATS2"
    "Infrastructure" = "False"
    "LastUpdated" = "07102024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}