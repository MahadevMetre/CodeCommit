iam_policy_name			= "lasso-rds-proxy-policy-pci"
iam_policy_tags			= {
		"environment"	= "pci"
		"CreatedBy"		= "saher"
		"terraform"		= "True"
		"project"		= "Lasso"
		"purpose"		= "Lasso Access RDS Proxy PCI"
		"CreatedOn"		= "08112022"
		"UpdatedOn"		= "08112022"
    }
lasso_rds_proxy_policy	= "true"
lasso_rds_dbuser_arn	= "arn:aws:rds-db:us-east-1:601751840347:dbuser:prx-025b2ebe626154487/*"
iam_policy_desc			= "Lasso Access RDS Proxy PCI"