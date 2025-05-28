secret_name				= "lasso-rds-postgres-secret-qa"
secret_description		= "Access to Postgres RDS DB QA"
secret_rc_window		= "0"
secret_tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "07142022",
		"DataClassification": "Low",
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

sg_name				= "lasso-rds-sg-qa"
sg_description		= "Lasso security group for rds instance QA"
sg_vpc_id			= "vpc-0051d323df13c7db3"
sg_tags				= {
	    "ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "07142022",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "06152023",
		"Name": "lasso-rds-sg-qa"
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
sg_ingress_rules  = {
	"1" = {
		from_port   = 5432
		to_port     = 5432
		protocol    = "tcp"
		cidr_blocks = ["10.153.18.0/23"]
		description = "Allow PostgreSQL connectivity from Private Subnets QA"
	}
}

rds_proxy_name				= "lasso-postgres-rds-proxy-qa"
rds_proxy_debug_logging		= false
rds_proxy_engine			= "POSTGRESQL"
rds_proxy_idle_timeout		= "900"
rds_proxy_tls				= true
rds_proxy_role_arn			= "arn:aws:iam::702230634984:role/lasso-rds-role-stage"
rds_proxy_vpc_subnets		= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
rds_proxy_auth_scheme		= "SECRETS"
rds_proxy_auth_description	= "Secrets to store Lasso rds db uid and pwd"
rds_proxy_auth_iam			= "DISABLED"
rds_proxy_tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "07142022",
		"DataClassification": "Low",
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

rds_proxy_target_db_identifier	= "rd-postgres-priv-stage1"