policy_name        = "marketing-lambda-inline-policy"
role_name          = "marketing-lambda-role-pci"
role_tags          = {
        "Department": "MKT"
        "LastUpdated": "06262023"
        "CostCenter":  "FMG"
        "CreatedOn": "NoInfo"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "Marketing"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "DevOps"
    }
parameter_arn      = [
                "arn:aws:ssm:us-east-1:601751840347:parameter/marketingservice-parameters-pci",
                "arn:aws:sns:us-east-1:601751840347:*",
                "arn:aws:ses:us-east-1:601751840347:identity/*",
                "arn:aws:cognito-idp:us-east-1:601751840347:userpool/us-east-1_8gL8kTpBn"
            ]
marketing-inline-policy = true
lambda_vpc_connect = true
lambda_execution = true