role_name							= "lasso-rds-role-pci"
iam_role_desc						= "Grant RDS access to secret manager PCI"
role_tags							= {
        "Department": "LSO"
		"LastUpdated": "07142022"
		"CostCenter": "FMG"
		"CreatedOn": "08112022"
		"DataClassification": "Low"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "1.0"
		"ApplicationName": "Lasso"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "DevOps"
    }
lasso-secrets-manager-policy		= true
lasso_secrets_manager_policy_arn	= "arn:aws:iam::601751840347:policy/lasso-secrets-manager-policy-pci"