role_name							= "lasso-rds-role-dr"
iam_role_desc						= "Grant RDS access to secret manager DR"
role_tags							= {
    "ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02202023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02202023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
    }
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::214946096060:policy/lasso-secrets-manager-policy-dr"