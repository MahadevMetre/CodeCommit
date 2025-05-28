proxy_arn          = "arn:aws:rds:us-east-1:634621569833:db-proxy:prx-06873b736f47d81b6"

secret_name        = "dashboard-rds-postgres-secret-test"
secret_description = "Access to Dasboard Postgres RDS DB test"
secret_rc_window   = "0"
secret_tags = {
  "ApplicationName"  = "Dasboard",
  "Automated"        = "True",
  "BackupPlan"       = "None",
  "CostCenter"       = "Operations",
  "CreatedBy"        = "DevOps",
  "CreatedOn"        = "06102024",
  "DataClassification"= "Low",
  "Department"       = "DSB",
  "Infrastructure"   = "False",
  "LastUpdated"      = "06102024",
  "TechStack"        = "AWS",
  "Usage"            = "Project",
  "Version"          = "1.0"
}

secret_values = {
  "username"              = "Dummy_value"
  "password"              = "Dummy_value"
}

sg_name           = "dashboard-rds-sg-test"
sg_description    = "dashboard security group for rds instance test"
sg_vpc_id         = "vpc-00f27e42f4b836922"
sg_tags           = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "06102024",
  "DataClassification"= "Low",
  "Department"      = "DOS",
  "Infrastructure"  = "False",
  "LastUpdated"     = "06102024",
  "Name"            = "dasboard-rds-sg-test",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}

sg_ingress_rules = {

  "1" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.22.0/23"]
    description = "QA Private Subnet"
  },

  "2" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.12/32"]
    description = "RDS Postgres From Jenkins"
  },

  "3" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.64.0.0/16"]
    description = "RDS Postgres From Palo VPN"
  },

  "4" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.21.150.0/24"]
    description = "Access for Franklin Office"
  },

  "5" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.10.200/32"]
    description = "RDS Postgres From Sonarqube"
  },

  "6" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["172.21.148.0/24"]
    description = "RDS Postgres From FMG Network & Access for Franklin Office"
  },

  "7" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["203.62.174.143/32"]
    description = "RDS Postgres From Virtusa"
  }
}

subnet_group_name = "dasboard-subnet-group-test"
subnet_ids = [
  "subnet-059a28296ee46f82f",
  "subnet-0aeea9e95e8137ce8"
]

rds_instance_parameter_group        = "dasboard-pg-param-group"
rds_instance_parameter_description  = "Parameter Group for Dashboard test"
rds_instance_parameter_group_family = "postgres16"
  tags = {
    "ApplicationName"       = "Dashboard"
    "Automated"             = "True"
    "BackupPlan"            = "None"
    "CostCenter"            = "FMG"
    "CreatedBy"             = "DevOps"
    "CreatedOn"             = "06122024"
    "DataClassification"    = "Low"
    "Department"            = "DOS"
    "Infrastructure"        = "False"
    "LastUpdated"           = "06122024"
    "TechStack"             = "AWS"
    "Usage"                 = "Project"
    "Version"               = "1.0"
  }

rds_instance_identifier       = "dasboard-postgres-rds-test"
rds_instance_engine           = "postgres"
rds_instance_class            = "db.t3.medium"
rds_instance_allocated_storage= "20"
rds_instance_subnet_group     = "dasboard-subnet-group-test"
rds_instance_multi_az         = true
rds_instance_storage_encrypted= true
rds_instance_kms_key_id       = "arn:aws:kms:us-east-1:634621569833:key/6981f92d-4de2-4e97-bb9c-0f01f0e488e3" //[FOR TESTING PURPOSE] 
rds_instance_db_name          = "dasboarddb"
rds_instance_tags = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "06102024",
  "DataClassification"= "Low",
  "Department"      = "DOS",
  "Infrastructure"  = "False",
  "LastUpdated"     = "06102024",
  "Name"            = "dasboard-rds-db",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}

parameter_group_name = "dasboard-pg-param-group-test"
parameter_group_family = "postgres16"
my_db_proxy = "dashboard-postgres-rds-proxy-qa"
rds_secret_id = "dashboard-rds-postgres-secret-test"
