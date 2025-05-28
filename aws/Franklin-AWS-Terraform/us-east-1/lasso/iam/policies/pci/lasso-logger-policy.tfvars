iam_policy_name			= "lasso-logger-policy-pci"
iam_policy_tags			= {
		"environment"	= "pci"
		"CreatedBy"		= "saher"
		"terraform"		= "True"
		"project"		= "Lasso"
		"purpose"		= "Lasso Logger Policy PCI"
		"CreatedOn"		= "08112022"
		"UpdatedOn"		= "08112022"
    }
lasso_logger_policy		= "true"
lasso_log_group_arn		= "arn:aws:logs:us-east-1:601751840347:*"
iam_policy_desc			= "Lasso Logger Policy PCI"