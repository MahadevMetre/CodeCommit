name			=	"digital-docker-lambda-sg"
description		=	"Security Group to attach for digital Lambda"
vpc_id			=	"vpc-00bd4d2758879b1e0"
tags			=	{
	"ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "07222024"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "07222024"
    "Name" = "digital-docker-lambda-sg"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

sg_ingress_rules = {
  "1" = {
	from_port			= 443
	to_port				= 443
	protocol			= "tcp"
	cidr_blocks			= ["10.153.28.0/22"]
	description			= "HTTPS From VPC"
  },
  "2" = {
	from_port			= 80
	to_port				= 80
	protocol			= "tcp"
	cidr_blocks			= ["10.153.28.0/22"]
	description			= "HTTP From VPC"
  },
  "3" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "HTTPS From Palo VPN"
	},
	"4" = {
    	from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.33.98.128/32"]
		description			= "HTTPS From ProdSys7"
  }
}