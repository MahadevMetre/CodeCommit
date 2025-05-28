role_name          = "marketing-apigw-accesslogs-qa"
role_tags          = {
        "Department": "MKT"
        "LastUpdated": "06262023"
        "CostCenter":  "FMG"
        "CreatedOn": "09012021"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Marketing"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "sbose"
     }

aws_managed_policy = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
aws_managed_policy_attach = true