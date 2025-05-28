name			= "digital-efs-sg-qa"
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
	"Name"					= "digital-efs-sg-qa"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
    "1" = {
		from_port	   = 2049
		to_port		   = 2049
		protocol	   = "tcp"
		cidr_blocks	   = ["10.153.22.0/23"]
		description	   = "NFS From Private Subnets qa"
	},
	"2" = {
        from_port      = 22
        to_port        = 22
        protocol       = "tcp"
		cidr_blocks	   = ["10.153.10.12/32"]
        description    = "SSH From DevOps Server"
    },
	"3" = {
        from_port      = 22
        to_port        = 22
        protocol       = "tcp"
		cidr_blocks	   = ["10.64.0.0/16"]
        description    = "SSH From Palo VPN"
    }
}