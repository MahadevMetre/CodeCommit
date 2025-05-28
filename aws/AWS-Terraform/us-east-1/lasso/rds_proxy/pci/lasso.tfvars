secret_name				= "lasso-rds-postgres-secret-pci"
secret_description		= "Access to Postgres RDS DB PCI"
secret_rc_window		= "0"
secret_tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "08112022",
		"DataClassification": "PCI",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06152023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}

secret_values = {
	"username"				= "DUMMY_VALUE"
	"password"				= "DUMMY_VALUE"
	"engine"				= "DUMMY_VALUE"
	"host"					= "DUMMY_VALUE"
	"port"					= "DUMMY_VALUE"
	"dbInstanceIdentifier"	= "DUMMY_VALUE"
}

sg_name				= "lasso-rds-sg-pci"
sg_description		= "Lasso security group for rds instance PCI"
sg_vpc_id			= "vpc-00bd4d2758879b1e0"
sg_tags				= {
	    "ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "08112022",
		"DataClassification": "PCI",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "08112022",
		"Name": "lasso-rds-sg-pci"
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0",
}
sg_ingress_rules  = {
	"1" = {
		from_port   = 5432
		to_port     = 5432
		protocol    = "tcp"
		cidr_blocks = ["10.153.30.0/23"]
		description = "Allow PostgreSQL connectivity from Private Subnets PCI"
	}
}

rds_proxy_name				= "lasso-postgres-rds-proxy-pci"
rds_proxy_debug_logging		= false
rds_proxy_engine			= "POSTGRESQL"
rds_proxy_idle_timeout		= "300"
rds_proxy_tls				= true
rds_proxy_role_arn			= "arn:aws:iam::601751840347:role/lasso-rds-role-pci"
rds_proxy_vpc_subnets		= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
rds_proxy_auth_scheme		= "SECRETS"
rds_proxy_auth_description	= "Secrets to store Lasso rds db uid and pwd"
rds_proxy_auth_iam			= "DISABLED"
rds_proxy_tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "08112022",
		"DataClassification": "PCI",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "08252023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}

rds_proxy_tg_connection_borrow_timeout		= "3"
rds_proxy_tg_max_idle_connections_percent	= "50"
rds_proxy_tg_max_connections_percent		= "75"

rds_proxy_target_db_identifier	= "rds-postgres-priv-pci1"