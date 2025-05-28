name			= "nginx-node-sg-qa"
description		= "Security group to allow inbound and outbound to efs mount server"
vpc_id			= "vpc-00f27e42f4b836922"
tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09062024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09062024"
	"Name"					= "nginx-node-sg-qa"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
  "1" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["10.153.20.0/24"]
    description   = "HTTPS from public ALB"
  },
  "2" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.64.0.0/16"]
    description   = "SSH from Palo VPN"
  },
  "3" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.153.10.219/32"]
    description   = "SSH from Verinext-SharedPrvConnect"
  },
  "4" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["203.62.174.143/32"]
    description   = "HTTPS from Virtusa"
  },
  "5" = {
    from_port     = 3389
    to_port       = 3389
    protocol      = "tcp"
    cidr_blocks   = ["10.153.10.219/32"]
    description   = "RDP from Verinext-SharedPrvConnect"
  },
  "6" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.33.99.102/32"]
    description   = "SSH from Devlsys7"
  },
  "7" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.153.10.12/32"]
    description   = "SSH"
  },
  "8" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["203.62.174.143/32"]
    description   = "SSH from Virtusa"
  },
  "10" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.141.0.0/16"]
    description   = "SSH from FMG Network"
  },
  "11" = {
    from_port     = 2049
    to_port       = 2049
    protocol      = "tcp"
    cidr_blocks   = ["10.153.22.0/23"]
    description   = "EFS mount target"
  },
  "12" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["172.21.148.0/24"]
    description   = "SSH"
  },
  "13" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["10.64.0.0/16"]
    description   = "HTTPS from Palo VPN"
  },
  "14" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["10.141.0.0/16"]
    description   = "HTTPS from FMG Network"
  },
  "15" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["172.21.148.0/24"]
    description   = "HTTPS"
  },
  "16" = {
    from_port     = 2049
    to_port       = 2049
    protocol      = "tcp"
    cidr_blocks   = ["10.153.21.0/24"]
    description   = "HTTPS from Public ALB"
  },
  "17" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.153.22.0/23"]
    description   = "SSH from Internal Network"
  },
  "18" = {
    from_port     = 3389
    to_port       = 3389
    protocol      = "tcp"
    cidr_blocks   = ["10.153.20.0/23"]
    description   = "RDP from Internal Network"
  },
  "19" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.33.99.105/32"]
    description   = "SSH from Devlsys8"
  },
  "20" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["203.62.174.145/32"]
    description   = "HTTPS from Virtusa"
  },
  "22" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["172.21.150.0/24"]
    description   = "SSH"
  },
  "23" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["172.21.150.0/24"]
    description   = "HTTPS"
  },
  "24" = {
    from_port     = 22
    to_port       = 22
    protocol      = "tcp"
    cidr_blocks   = ["10.217.33.72/31"]
    description   = "SSH"
  },
  "25" = {
    from_port     = 443
    to_port       = 443
    protocol      = "tcp"
    cidr_blocks   = ["10.153.22.0/23"]
    description   = "HTTPS"
  }  
}