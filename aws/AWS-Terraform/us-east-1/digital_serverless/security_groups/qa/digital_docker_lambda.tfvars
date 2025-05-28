name			=	"digital-docker-lambda-sg"
description		=	"Security Group to attach for digital Lambda"
vpc_id			=	"vpc-00f27e42f4b836922"
tags =	{
	  "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "06132024"
    "DataClassification" = "Low"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "08082024"
    "Name" = "digital-docker-lambda-sg"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}
sg_ingress_rules = {
  "1" = {
	from_port			  = 443
	to_port				  = 443
	protocol			  = "tcp"
	cidr_blocks			= ["10.153.22.0/23"]
	description			= "HTTPS From Private Subnet"
  }
}