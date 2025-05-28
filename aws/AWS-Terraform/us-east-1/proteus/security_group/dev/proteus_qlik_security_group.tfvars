name = "proteus_qlik_security_group"
description = "Allows Qlik Replication software to do as400/redshift ops"
vpc_id = "vpc-00ff8e33839358d28"
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
	cidr_blocks = ["10.153.12.13/32"]
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
	cidr_blocks = ["10.153.12.84/32"]
    description = "Qlik Access to Jump Box"
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
	cidr_blocks = ["34.224.70.69/32"]
    description = "Dev Jump Box"
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