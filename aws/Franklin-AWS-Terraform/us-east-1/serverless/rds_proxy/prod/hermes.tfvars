secret_name				= "hermes-rds-postgres-secret-prod"
secret_description		= "Access to Hermes Postgres RDS DB Prod"
secret_rc_window		= "0"
secret_tags = {
		"ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "08212023",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "08212023",
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

sg_name				= "hermes-rds-sg-prod"
sg_description		= "Hermes security group for rds instance Prod"
sg_vpc_id			= "vpc-021b1f680addbd6db"
sg_tags				= {
	    "ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "08212023",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "08212023",
		"Name": "hermes-rds-sg-prod",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}
sg_ingress_rules  = {
	"1" = {
		from_port   = 5432
		to_port     = 5432
		protocol    = "tcp"
		cidr_blocks = ["10.153.2.0/23"]
		description = "Allow PostgreSQL connectivity from Private Subnets Prod"
	}
}

rds_proxy_name				= "hermes-postgres-rds-proxy-prod"
rds_proxy_debug_logging		= false
rds_proxy_engine			= "POSTGRESQL"
rds_proxy_idle_timeout		= "600"
rds_proxy_tls				= true
rds_proxy_role_arn			= "arn:aws:iam::361469336240:role/hermes-rds-role-prod"
rds_proxy_vpc_subnets		= ["subnet-0052ab706c1f947c9", "subnet-011ed7a9e6d735228"]
rds_proxy_auth_scheme		= "SECRETS"
rds_proxy_auth_description	= "Secrets to store Hermes rds db uid and pwd"
rds_proxy_auth_iam			= "DISABLED"
rds_proxy_tags = {
	    "ApplicationName": "Hermes2.0",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "Operations",
		"CreatedBy": "DevOps",
		"CreatedOn": "08212023",
		"DataClassification": "None",
		"Department": "HMS2",
		"Infrastructure": "False",
		"LastUpdated": "09272023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}

rds_proxy_tg_connection_borrow_timeout		= "3"
rds_proxy_tg_max_idle_connections_percent	= "50"
rds_proxy_tg_max_connections_percent		= "75"

rds_proxy_target_db_identifier	= "rds-pg-fmg-serverless-prod"