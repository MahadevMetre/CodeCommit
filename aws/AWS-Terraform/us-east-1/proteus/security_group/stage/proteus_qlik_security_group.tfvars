name = "proteus_qlik_security_group"
description = "Allows Qlik Replication software to do as400/redshift ops"
vpc_id = "vpc-0051d323df13c7db3"
tags ={
    "ApplicationName" = "Proteus"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "02072024"
    "DataClassification" = "Low"
    "Department" = "PTS"
    "Infrastructure" = "False"
    "LastUpdated" = "02072024"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}


sg_ingress_rules  = {
  "1" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.153.16.113/32"]
    description = "RDP"
  },
  "2" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-Charlesl.-Shared account"
  },
  "3" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "Virtusa Navalur Tunnel RDP"
  },
  "4" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.70/32"]
    description = "RDP From Sujay Office"
  },
  "5" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "RDP From FMG Network"
  },
  "6" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["52.55.180.154/32"]
    description = "Verinext Jump Box"
  },
  "7" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.66.64.0/24"]
    description = "RDP Ports"
  },
  "8" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "RDP From Palo VPN"
  },
  "9" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["139.61.38.119/32"]
    description = "RDP From acxiom"
  }
}