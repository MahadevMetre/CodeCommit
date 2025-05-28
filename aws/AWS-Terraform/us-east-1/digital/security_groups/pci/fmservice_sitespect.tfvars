name			=	"SiteSpect_IPs"
description		=	"Security Group to allow SiteSpect IPs"
vpc_id			=	"vpc-00bd4d2758879b1e0"
tags			=	{
	"ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "03292023"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

sg_ingress_rules = {
  "1" = {
	from_port			= 443
	to_port				= 443
	protocol			= "tcp"
	cidr_blocks			= ["128.204.202.10/32",
							"128.204.202.15/32",
							"128.204.202.16/32",
							"128.204.202.18/32",
							"128.204.202.20/32",
							"128.204.202.6/32",
							"128.204.202.8/32",
							"128.204.202.9/32",
							"159.255.218.0/23",
							"212.118.236.128/25",
							"212.118.252.0/24",
							"31.186.232.0/24",
							"37.230.97.9/32",
							"63.251.76.0/25",
							"64.74.109.0/25",
							"64.95.178.0/23",
							"64.95.188.0/23",
							"64.95.190.128/25",
							"66.150.186.0/23",
							"66.151.229.0/25",
							"66.151.237.88/30",
							"69.25.154.0/23",
							"69.88.159.0/24",
							"70.42.252.0/25",
							"74.217.150.128/25",
							"74.217.214.0/23",
							"74.217.254.0/23",
							"74.94.137.129/32",
							"75.98.48.0/23",
							"75.98.51.0/24",
							"88.84.156.160/27"]
	description			= "HTTPS From SiteSpect POPs"
  },
  "2" = {
	from_port			= 443
	to_port				= 443
	protocol			= "tcp"
	cidr_blocks			= ["216.52.63.214/32",
							"34.90.192.162/32",
							"34.91.127.42/32",
							"87.195.2.32/29"]
	description			= "HTTPS From SiteSpect Corporate Office"
  }
}