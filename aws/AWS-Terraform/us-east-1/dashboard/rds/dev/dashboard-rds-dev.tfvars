sg_name           = "dashboard-rds-sg-dev-test"
sg_description    = "dashboard security group for rds instance dev"
sg_vpc_id         = "vpc-00ff8e33839358d28"
sg_tags           = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "06052024",
  "DataClassification"= "Low",
  "Department"      = "DSB",
  "Infrastructure"  = "False",
  "LastUpdated"     = "06052024",
  "Name"            = "dasboard-rds-sg-dev",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}
 
sg_ingress_rules = {
 
  "1" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.14.0/23"]
    description = "Dev Private Subnet"
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
  },
  "8" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.12.0/22"]
    description = "VPC Access"
  }
}
 
subnet_group_name = "dasboard-subnet-group-dev"
subnet_ids = [
  "subnet-06291ceaa523f684c",
  "subnet-0734d8f28467d319f"
]
 
rds_instance_identifier       = "dasboard-postgres-rds-dev"
rds_instance_engine           = "postgres"
rds_instance_class            = "db.t3.medium"
rds_instance_allocated_storage= "20"
rds_instance_subnet_group     = "dasboard-subnet-group"
rds_instance_multi_az         = true
rds_instance_storage_encrypted= true
rds_instance_kms_key_id       = "arn:aws:kms:us-east-1:116762271881:key/a139cc43-66d4-476e-aeae-114f5401efe9" //[FOR TESTING PURPOSE]
rds_instance_db_name          = "dasboarddb"
rds_instance_parameter_group  = "dasboard-pg-param-group"
rds_instance_tags = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "06052024",
  "DataClassification"= "Low",
  "Department"      = "DSB",
  "Infrastructure"  = "False",
  "LastUpdated"     = "06052024",
  "Name"            = "dasboard-rds-db",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}
 
parameter_group_name = "dasboard-pg-param-group"
parameter_group_family = "postgres16"
rds_secret_id = "dashboard-rds-postgres-secret-dev"
rds_instance_parameter_description = "Parameter Group For Dev RDS"
rds_instance_parameter_group_family = "postgres16"
rds_username = "postgres"
# my_db_proxy = "dashboard-postgres-rds-proxy-dev-test"
# proxy_role_arn    = "arn:aws:iam::116762271881:role/lasso-rds-role-dev"
