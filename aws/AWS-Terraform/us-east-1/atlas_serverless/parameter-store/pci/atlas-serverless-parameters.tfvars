name        = "atlas-serverless-parameters-pci"
description = "Parameter Store for Atlas Service"
type        = "SecureString"
value       = "{
    \"DB_CONNECTION_POOL_WS\":\"DUMMYVALUE\",
    \"MINIMUM_IDLE\":\"DUMMYVALUE\",
    \"DRIVER_CLASS_NAME\":\"DUMMYVALUE\",
    \"CONNECTION_TIMEOUT\":\"DUMMYVALUE\",
    \"IDLE_TIMEOUT\":\"DUMMYVALUE\",
    \"MAX_LIFE_TIME\":\"DUMMYVALUE\",
    \"JDBC_URL_PREFIX\":\"DUMMYVALUE\",
    \"CAPTIVA_AWS_SQS_ENDPOINT\":\"DUMMYVALUE",
    \"CAPTIVA_AWS_SQS_ERRORQUEUE_ENDPOINT\":\"DUMMYVALUE\",
    \"CAPTIVA_AWS_SQS_CRON_EXPRESSION\":\"DUMMYVALUE\",
    \"S3_RESTORE_AWS_SQS_ENDPOINT\":\"DUMMYVALUE\",
    \"S3_RESTORE_AWS_SQS_ERRORQUEUE_ENDPOINT\":\"DUMMYVALUE\",
    \"RESTORE_QUEUE_AWS_SQS_CRON_EXPRESSION\":\"DUMMYVALUE\",
    \"S3_ARCHIVE_AWS_SQS_ENDPOINT\":\"DUMMYVALUE",
    \"S3_ARCHIVE_AWS_SQS_ERRORQUEUE_ENDPOINT\":\"DUMMYVALUE\",
    \"ARCHIVE_QUEUE_AWS_SQS_CRON_EXPRESSION\":\"DUMMYVALUE\",
    \"EXCEPTION_EMAIL_FROM\":\"DUMMYVALUE\",
    \"EXCEPTION_EMAIL_TO\":\"DUMMYVALUE\"
}"
key_id      = "alias/atlas/kms"
tier        = "Standard"
tags = {
        "Department": "ATS2"
		"LastUpdated": "08302024"
		"CostCenter": "FMG"
		"CreatedOn": "08302024"
		"DataClassification": "PCI"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "2.0"
		"ApplicationName": "Atlas2.0"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "DevOps"
}