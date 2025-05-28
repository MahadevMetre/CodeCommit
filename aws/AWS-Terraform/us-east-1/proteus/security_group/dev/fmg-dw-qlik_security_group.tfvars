name = "dw_qlik_security_group"
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
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "	SSH"
  },
  "2" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.12/32"]
    description = "SSH From DevOps server"
  },
  "3" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.153.12.13/32"]
    description = "RDP"
  },
  "4" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "Console"
  },
  "5" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["202.168.90.114/32"]
    description = "Virtusa Navalur Tunnel RDP"
  },
  "6" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "RDP From FMG Network"
  },
  "7" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "SSH"
  },
  "8" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "HTTPS"
  },
  "9" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["172.21.150.0/24"]
    description = "Console"
  },
  "10" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "SSH From FMG Network"
  },
  "11" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.153.12.84/32"]
    description = "Qlik Access to Jump Box"
  },
  "12" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "HTTPS From Palo VPN"
  },
  "13" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.153.10.219/32"]
    description = "Verinext-Charlesl.-Shared account"
  },
  "14" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["172.21.148.0/24"]
    description = "HTTPS"
  },
  "15" = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/24"]
    description = "HTTP For slaves"
  },
  "16" = {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
	cidr_blocks = ["10.153.15.0/24"]
    description = "HTTP For slaves"
  },
   "17" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/24"]
    description = "HTTPS For slaves"
  },
  "18" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/24"]
    description = "EFS mount target"
  },
  "19" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.0/24"]
    description = "Console access for slave"
  },
  "20" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.12.155/32"]
    description = ""
  },
  "21" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["34.224.70.69/32"]
    description = "Dev Jump Box"
  },
  "22" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["34.224.70.69/32"]
    description = "dev jump box ssh"
  },
  "23" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "HTTPS From Virtusa"
  },
  "24" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.153.15.0/24"]
    description = "Console access for slave"
  },
  "25" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "HTTPS From FMG Network"
  },
  "26" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.153.14.124/32"]
    description = "SSH"
  },
  "27" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "Console access for Jboss slave"
  },
  "28" = {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
	cidr_blocks = ["10.153.15.0/24"]
    description = "EFS mount target"
  },
  "29" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "SSH From Palo VPN"
  },
  "30" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "SSH From Virtusa"
  },
  "31" = {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
	cidr_blocks = ["10.64.0.0/16"]
    description = "RDP From Palo VPN"
  },
  "32" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["10.141.0.0/16"]
    description = "Console access for slave"
  },
  "33" = {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
	cidr_blocks = ["10.153.15.0/24"]
    description = "HTTPS for slave"
  },
  "34" = {
    from_port   = 9990
    to_port     = 9995
    protocol    = "tcp"
	cidr_blocks = ["203.62.174.143/32"]
    description = "Console access from Virtusa"
  }
}