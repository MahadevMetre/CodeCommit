name			=	"lasso-vpc-interface-sg-pci"
description		=	"Security group for Lasso SGW VPC Interface PCI"
vpc_id			=	"vpc-00bd4d2758879b1e0"
tags			=	{
    "ApplicationName" = "Lasso"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "10062022"
    "DataClassification" = "Low"
    "Department" = "LSO"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

sg_ingress_rules = {
  "1" = {
	from_port	= 443
	to_port		= 443
	protocol	= "tcp"
	cidr_blocks	= ["10.153.28.0/22"]
	description	= "HTTPS From Subnet"
  },
  "2" = {
	from_port	= 1026
	to_port		= 1028
	protocol	= "tcp"
	cidr_blocks	= ["10.153.28.0/22"]
	description	= "Required for Storage Gateway"
  },
  "3" = {
	from_port	= 1031
	to_port		= 1031
	protocol	= "tcp"
	cidr_blocks	= ["10.153.28.0/22"]
	description	= "Required for Storage Gateway"
  },
  "4" = {
	from_port	= 2222
	to_port		= 2222
	protocol	= "tcp"
	cidr_blocks	= ["10.153.28.0/22"]
	description	= "Required for Storage Gateway"
  }
}

vpc_endpoint_type		= "Interface"
subnet_ids				= ["subnet-0a797df6e7dcae3db", "subnet-0a33ed77fe2cfb6ef"]

s3_vpce_service_name	= "com.amazonaws.us-east-1.s3"
s3_vpce_tags = {
	"ApplicationName" = "Lasso"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "10062022"
    "DataClassification" = "Low"
    "Department" = "LSO"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
 
sgw_vpce_service_name	= "com.amazonaws.us-east-1.storagegateway"
sgw_vpce_tags = {
	"ApplicationName" = "Lasso"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "10062022"
    "DataClassification" = "Low"
    "Department" = "LSO"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}