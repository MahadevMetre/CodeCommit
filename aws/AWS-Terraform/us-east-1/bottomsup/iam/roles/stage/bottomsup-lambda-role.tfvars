role_name							= "bottomsup-lambda-role-stage"
iam_role_desc						= "Allows Lambda to call AWS services Stage"
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
        "CreatedBy": "sbose"
    }
lasso-logger-policy					= true
lasso_logger_policy_arn				= "arn:aws:iam::702230634984:policy/bottomsup-logger-policy-stage"
lasso-rds-proxy-policy				= true
lasso_rds_proxy_policy_arn			= "arn:aws:iam::702230634984:policy/bottomsup-rds-proxy-policy-stage"
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::702230634984:policy/bottomsup-secrets-manager-policy-stage"
lasso-vpc-access-policy				= true
lasso_vpc_access_policy_arn			= "arn:aws:iam::702230634984:policy/bottomsup-vpc-access-policy-stage"