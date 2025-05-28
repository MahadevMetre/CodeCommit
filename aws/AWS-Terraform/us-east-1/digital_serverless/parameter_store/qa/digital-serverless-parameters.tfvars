name        = "digital-serverless-parameters-qa"
description = "Parameter Store for Stage Marketing Service"
type        = "SecureString"
value       = "{\"DB_CONNECTION_POOL_WS\":\"200\",\"DB_CONNECTION_POOL_CUST_PROFILE_JOB\":\"20\",\"DB_CONNECTION_POOL_DISCARD_JOB\":\"20\",\"DB_CONNECTION_POOL_MB_ENROLL_JOB\":\"20\",\"DB_CONNECTION_POOL_MB_ENROLL_FAILURE_JOB\":\"20\",\"DB_CONNECTION_POOL_ACC_NOTIFY_JOB\":\"20\",\"CONNECTION_TIMEOUT\":\"30000\",\"MAX_LIFE_TIME\":\"1800000\",\"MINIMUM_IDLE\":\"10\",\"DRIVER_CLASS_NAME\":\"com.ibm.as400.access.AS400JDBCDriver\",\"JDBC_URL_PREFIX\":\"jdbc:as400://\",\"IDLE_TIMEOUT\":\"600000\",\"SMTP_HOST\":\"email-smtp.us-east-1.amazonaws.com\",\"SMTP_PORT\":\"587\",\"EXCEPTION_EMAIL_TO\":\"Digital Admin <ins_middletier_exception_nonprod@franklin-madison.com>\",\"CUSTOMER_SERVICE_INCOMING_QUEUE_NAME\":\"https://sqs.us-east-1.amazonaws.com/702230634984/digital_customer_service_incoming_queue_stage.fifo\",\"CUSTOMER_SERVICE_ERROR_QUEUE_NAME\":\"https://sqs.us-east-1.amazonaws.com/702230634984/digital_customer_service_error_queue_stage.fifo\",\"CUSTOMER_PROFILE_INCOMING_QUEUE_NAME\":\"https://sqs.us-east-1.amazonaws.com/702230634984/digital_customer_profile_incoming_queue_stage.fifo\",\"CUSTOMER_PROFILE_ERROR_QUEUE_NAME\":\"https://sqs.us-east-1.amazonaws.com/702230634984/digital_customer_profile_error_queue_stage.fifo\",\"POST_CONFIRMATION_INCOMING_QUEUE_NAME\":\"https://sqs.us-east-1.amazonaws.com/702230634984/selfservice-confirm-user-incoming-stage\",\"POST_CONFIRMATION_ERROR_QUEUE_NAME\":\"https://sqs.us-east-1.amazonaws.com/702230634984/selfservice-confirm-user-error-stage\",\"EMAIL_UPDATE_QUEUE_FLAG\":\"false\",\"PHONE_NUMBER_UPDATE_QUEUE_FLAG\":\"false\"}"
key_id      = "alias/digital/kms"
tier        = "Standard"
tags = {
		"Department": "DGT"
        "LastUpdated": "08052024"
        "CostCenter":  "FMG"
        "CreatedOn": "08052024"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Digital"
        "TechStack": "None"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "mmetre"
    }



