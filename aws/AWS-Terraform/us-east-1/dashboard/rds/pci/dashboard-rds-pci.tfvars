#proxy_role_arn    = "arn:aws:iam::601751840347:role/lasso-rds-role-pci" 
sg_name           = "dashboard-rds-sg-pci"
sg_description    = "dashboard security group for rds instance pci"
sg_vpc_id         = "vpc-00bd4d2758879b1e0"
sg_tags           = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "09252024",
  "DataClassification"= "PCI",
  "Department"      = "DSB",
  "Infrastructure"  = "False",
  "LastUpdated"     = "09252024",
  "Name"            = "dasboard-rds-sg-pci",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}
 
sg_ingress_rules = {
 
  "1" = {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.153.30.0/23"]
    description = "PCI Private Subnet"
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
    cidr_blocks = ["10.153.28.0/22"] 
    description = "VPC Access"
  }
}
 
subnet_group_name = "dasboard-subnet-group-pci"
subnet_ids = [
  "subnet-0a33ed77fe2cfb6ef",
   "subnet-0a797df6e7dcae3db"
]
 
rds_instance_identifier       = "dasboard-postgres-rds-pci"
rds_instance_engine           = "postgres"
rds_instance_class            = "db.t3.medium"
rds_instance_allocated_storage= "20"
rds_instance_subnet_group     = "dasboard-subnet-group"
rds_instance_multi_az         = true
rds_instance_storage_encrypted= true
rds_instance_kms_key_id       = "arn:aws:kms:to-be-updated"
rds_instance_db_name          = "dasboarddb"
rds_instance_parameter_group  = "dasboard-pg-param-group"
rds_instance_tags = {
  "ApplicationName" = "Dasboard",
  "Automated"       = "True",
  "BackupPlan"      = "None",
  "CostCenter"      = "Operations",
  "CreatedBy"       = "DevOps",
  "CreatedOn"       = "09252024",
  "DataClassification"= "PCI",
  "Department"      = "DSB",
  "Infrastructure"  = "False",
  "LastUpdated"     = "09252024",
  "Name"            = "dasboard-rds-db",
  "TechStack"       = "AWS",
  "Usage"           = "Project",
  "Version"         = "1.0"
}
 
parameter_group_name = "dasboard-pg-param-group"
parameter_group_family = "postgres16"
#my_db_proxy = "dashboard-postgres-rds-proxy-pci"
rds_secret_id = "dashboard-rds-postgres-secret-pci"
 
 
 
rds_instance_parameter_description = "Description of the parameter group"
rds_instance_parameter_group_family = "postgres16"
 
rds_username = "postgresuser"
													   
																		 
