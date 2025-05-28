name			=	"Imperva_IPs"
description		=	"Security Group to allow imperva IPs"
vpc_id			=	"vpc-0e79e26eb537504d0"
tags			=	{
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "02272023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "02272023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "Imperva_IPs"
}

sg_ingress_rules = {
  "1" = {
	from_port			= 443
	to_port				= 443
	protocol			= "tcp"
	cidr_blocks			= ["199.83.128.0/21",
							"198.143.32.0/19",
							"149.126.72.0/21",
							"103.28.248.0/22",
							"185.11.124.0/22",
							"192.230.64.0/18",
							"45.64.64.0/22",
							"107.154.0.0/16",
							"45.60.0.0/16",
							"45.223.0.0/16"]
	ipv6_cidr_blocks	= []
	description	= "Imperva IPv4 Address"
  },
  "2" = {
	from_port			= 443
	to_port				= 443
	protocol			= "tcp"
	cidr_blocks			= []
	ipv6_cidr_blocks	= ["2a02:e980::/29"]
	description			= "Imperva IPv6 Address"
  }
}