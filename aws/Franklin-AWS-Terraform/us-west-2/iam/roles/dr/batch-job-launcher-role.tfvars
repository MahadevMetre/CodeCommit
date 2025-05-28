policy_name			= "batch-job-launcher-role-policy-dr"
role_name			= "batch-job-launcher-role-dr"
role_tags			= {
        "Department": "BatchIntegration"
        "LastUpdated": "05242023"
        "CostCenter":  "FMG"
        "CreatedOn": "05242023"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "BatchIntegration"
        "TechStack": "None"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "mfaizudeen"
    }
lambda_vpc_connect					= true
batch-job-launcher-role-policy		= true
eventbridge_scheduler_source_arn	= "arn:aws:scheduler:us-west-2:214946096060:schedule/batch_integration/*"