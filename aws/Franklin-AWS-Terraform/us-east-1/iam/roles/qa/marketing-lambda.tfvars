policy_name        = "marketing-lambda-inline-policy"
role_name          = "marketing-lambda-role-qa"
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
        "CreatedBy": "sbose"
    }
parameter_arn      = [
                "arn:aws:ssm:us-east-1:634621569833:parameter/*",
                "arn:aws:sns:us-east-1:634621569833:*",
                "arn:aws:ses:us-east-1:634621569833:identity/*",
                "arn:aws:cognito-idp:us-east-1:634621569833:userpool/*"
            ]
sqs_arn_val        = "arn:aws:sqs:us-east-1:634621569833:selfservice-confirm-user-incoming-dev"
marketing-inline-policy = true
lambda_vpc_connect = true
lambda_execution = true