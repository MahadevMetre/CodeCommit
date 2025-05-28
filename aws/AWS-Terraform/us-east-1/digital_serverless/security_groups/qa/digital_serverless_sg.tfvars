name			=	"digital-serverless-sg-qa"
description		=	"Security group to allow inbound to services generic"
vpc_id			=	"vpc-00f27e42f4b836922"

sg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07152023"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "07302024"
	"Name"					= "digital-serverless-sg-qa"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
	"1" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.22.0/23"]
		description			= "TomCat port within Private Subnets qa"
	},
	"2" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "SSH From Palo VPN"
	},
	"3" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.33.99.102/32"]
		description			= "SSH from DEVLSYS"
	},
	"4" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.33.99.102/32"]
		description			= "HTTPS from DEVLSYS"
	},
	"5" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["202.168.90.114/32"]
		description			= "HTTP From Virtusa Navalur"
	},
	"6" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["203.62.174.143/32"]
		description			= "HTTP From Virtusa Navalur"
	},
	"7" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "HTTP From FMG VPN"
	},
    "8" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "HTTPS From Palo VPN"
	},
	"9" = {
    	from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.33.98.128/32"]
		description			= "HTTPS From ProdSys7"
  },
    "10" = {
	    from_port			= 443
	    to_port				= 443
	    protocol			= "tcp"
	    cidr_blocks			= ["10.153.22.0/23"]
	    description			= "HTTPS From Private Subnet"
  },  
    "11" = {
	    from_port			= 80
	    to_port				= 80
	    protocol			= "tcp"
	    cidr_blocks			= ["10.153.22.0/23"]
	    description			= "HTTP From Private Subnet"
  }  
}