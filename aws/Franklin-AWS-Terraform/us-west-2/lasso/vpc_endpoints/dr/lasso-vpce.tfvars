name			=	"lasso-vpc-interface-sg-dr"
description		=	"Security group for Lasso SGW VPC Interface DR"
vpc_id			=	"vpc-0e79e26eb537504d0"
tags			=	{
    "ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02152023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02152023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
    "Name"	= "lasso-vpc-interface-sg-dr"
}

sg_ingress_rules = {
  "1" = {
	from_port	= 443
	to_port		= 443
	protocol	= "tcp"
	cidr_blocks	= ["10.153.40.0/21"]
	description	= "HTTPS From Subnet"
  },
  "2" = {
	from_port	= 1026
	to_port		= 1028
	protocol	= "tcp"
	cidr_blocks	= ["10.153.40.0/21"]
	description	= "Required for Storage Gateway"
  },
  "3" = {
	from_port	= 1031
	to_port		= 1031
	protocol	= "tcp"
	cidr_blocks	= ["10.153.40.0/21"]
	description	= "Required for Storage Gateway"
  },
  "4" = {
	from_port	= 2222
	to_port		= 2222
	protocol	= "tcp"
	cidr_blocks	= ["10.153.40.0/21"]
	description	= "Required for Storage Gateway"
  }
}

vpc_endpoint_type		= "Interface"
subnet_ids				= ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]

s3_vpce_service_name	= "com.amazonaws.us-west-2.s3"
s3_vpce_tags = {
	"Name"	= "lasso-s3-interface-dr"
	"ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02152023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02152023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
 
sgw_vpce_service_name	= "com.amazonaws.us-west-2.storagegateway"
sgw_vpce_tags = {
	"Name"	= "lasso-sgw-interface-dr"
	"ApplicationName" = "Lasso"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02152023"
	"DataClassification" = "Low"
	"Department" = "LSO"
	"Infrastructure" = "False"
	"LastUpdated" = "02152023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}