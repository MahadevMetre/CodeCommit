proxy_arn          = "TO BE UPDATED"

secret_name        = "dashboard-rds-postgres-secret-stage"
secret_description = "Access to Dasboard Postgres RDS DB Stage"
secret_rc_window   = "0"
secret_tags = {
  "ApplicationName"  = "Dasboard",
  "Automated"        = "True",
  "BackupPlan"       = "None",
  "CostCenter"       = "Operations",
  "CreatedBy"        = "DevOps",
  "CreatedOn"        = "06102024",
  "DataClassification"= "None",
  "Department"       = "DSB",
  "Infrastructure"   = "False",
  "LastUpdated"      = "06102024",
  "TechStack"        = "AWS",
  "Usage"            = "Project",
  "Version"          = "1.0"
}


secret_values = {
  "username"              = "DUMMY_VALUE"
  "password"              = "DUMMY_VALUE"
}

sg_name           = "dashboard-rds-sg-stage"
sg_description    = "dashboard security group for rds instance stage"
sg_vpc_id         = "vpc-0051d323df13c7db3"
sg_tags           = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "06102024",
  "DataClassification"= "None",
  "Department"      = "DSB",
  "Infrastructure"  = "False",
  "LastUpdated"     = "06102024",
  "Name"            = "dasboard-rds-sg-stage",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}

sg_ingress_rules = {

  "1" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.18.0/23"]
    description = "Stage Private Subnet"
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

subnet_group_name = "dasboard-subnet-group-stage"
subnet_ids = [
  "subnet-0ed61b6beb807094e",
  "subnet-076a071fa0723c80e"
]

rds_instance_parameter_group        = "dasboard-pg-param-group"
rds_instance_parameter_description  = "Parameter Group for Dashboard Stage"
rds_instance_parameter_group_family      = "postgres16"
  tags = {
    "ApplicationName"       = "Dashboard"
    "Automated"             = "True"
    "BackupPlan"            = "None"
    "CostCenter"            = "FMG"
    "CreatedBy"             = "DevOps"
    "CreatedOn"             = "06122024"
    "DataClassification"    = "Low"
    "Department"            = "DSB"
    "Infrastructure"        = "False"
    "LastUpdated"           = "06122024"
    "TechStack"             = "AWS"
    "Usage"                 = "Project"
    "Version"               = "1.0"
  }															   

rds_instance_identifier       = "dasboard-postgres-rds-stage"
rds_instance_engine           = "postgres"
rds_instance_class            = "db.t3.medium"
rds_instance_allocated_storage= "20"
rds_instance_subnet_group     = "dasboard-subnet-group-stage"
rds_instance_multi_az         = true
rds_instance_storage_encrypted= true
rds_instance_kms_key_id       = "arn:aws:kms:us-east-1:702230634984:key/99973b13-86bd-45a0-9ccd-35a2865b2eb5" 
rds_instance_db_name          = "dasboarddb"
rds_instance_tags = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "06102024",
  "DataClassification"= "None",
  "Department"      = "DSB",
  "Infrastructure"  = "False",
  "LastUpdated"     = "06102024",
  "Name"            = "dasboard-rds-sg-stage",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}

parameter_group_name = "dasboard-pg-param-group"
parameter_group_family = "postgres16"
my_db_proxy = "dashboard-postgres-rds-proxy-stage"
rds_secret_id = "dashboard-rds-postgres-secret-stage"

