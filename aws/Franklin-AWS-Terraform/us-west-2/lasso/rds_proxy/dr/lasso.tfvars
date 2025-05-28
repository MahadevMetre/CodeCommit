secret_name				= "lasso-rds-postgres-secret-dr"
secret_description		= "Access to Postgres RDS DB DR"
secret_rc_window		= "0"
secret_tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "mfaizudeen",
		"CreatedOn": "02162023",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "04272023",
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

sg_name				= "lasso-rds-sg-dr"
sg_description		= "Lasso security group for rds instance DR"
sg_vpc_id			= "vpc-0e79e26eb537504d0"
sg_tags				= {
	    "ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "02162023",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "04142023",
		"Name": "lasso-rds-sg-dr"
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0",
}
sg_ingress_rules  = {
	"1" = {
		from_port   = 5432
		to_port     = 5432
		protocol    = "tcp"
		cidr_blocks = ["10.153.42.0/23"]
		description = "Allow PostgreSQL connectivity from Private Subnets DR"
	}
}

rds_proxy_name				= "lasso-postgres-rds-proxy-dr"
rds_proxy_debug_logging		= false
rds_proxy_engine			= "POSTGRESQL"
rds_proxy_idle_timeout		= "300"
rds_proxy_tls				= true
rds_proxy_role_arn			= "arn:aws:iam::214946096060:role/lasso-rds-role-dr"
rds_proxy_vpc_subnets		= ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
rds_proxy_auth_scheme		= "SECRETS"
rds_proxy_auth_description	= "Secrets to store Lasso rds db uid and pwd"
rds_proxy_auth_iam			= "DISABLED"
rds_proxy_tags = {
		"ApplicationName": "Lasso",
		"Automated": "True",
		"BackupPlan": "None",
		"CostCenter": "FMG",
		"CreatedBy": "DevOps",
		"CreatedOn": "02162023",
		"DataClassification": "Low",
		"Department": "LSO",
		"Infrastructure": "False",
		"LastUpdated": "04142023",
		"TechStack": "AWS",
		"Usage": "Project",
		"Version": "1.0"
}

rds_proxy_tg_connection_borrow_timeout		= "3"
rds_proxy_tg_max_idle_connections_percent	= "50"
rds_proxy_tg_max_connections_percent		= "75"

rds_proxy_target_db_identifier	= "rds-postgres-priv-dr3"