role_name							= "bottomsup-lambda-role-dev"
iam_role_desc						= "Allows Lambda to call AWS services Dev"
role_tags							= {
        "Department": "BottomsUp"
        "LastUpdated": "01242023"
        "CostCenter":  "FMG"
        "CreatedOn": "01242023"
        "DataClassification": "Low"
        "Infrastructure": "False"
        "Usage":"Project"
        "Version": "1.0"
        "ApplicationName": "BottomsUp"
        "TechStack": "AWS"
        "Automated": "True"
        "BackupPlan": "None"
        "CreatedBy": "mmadhu"
    }
lasso-logger-policy					= true
lasso_logger_policy_arn				= "arn:aws:iam::116762271881:policy/bottomsup-logger-policy-dev"
lasso-rds-proxy-policy				= true
lasso_rds_proxy_policy_arn			= "arn:aws:iam::116762271881:policy/bottomsup-rds-proxy-policy-dev"
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::116762271881:policy/bottomsup-secrets-manager-policy-dev"
lasso-vpc-access-policy				= true
lasso_vpc_access_policy_arn			= "arn:aws:iam::116762271881:policy/bottomsup-vpc-access-policy-dev" 