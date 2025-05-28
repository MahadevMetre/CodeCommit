sg_name				= "fmg-batchintegration-sg-pci"
sg_description		= "Security group to allow inbound from batchintegration secrets manager"
sg_vpc_id			= "vpc-021b1f680addbd6db"
sg_tags = {
	"ApplicationName"		= "BatchIntegration2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08272024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08272024"
	"Name"					= "fmg-batchintegration-sg-pci"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
	"1" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.219.33.38/32"]
		description			= "SSH for EFT PCI"
	},
	"2" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.219.33.37/32"]
		description			= "SSH for EFT PCI"
	},
	"3" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.219.33.33/32"]
		description			= "SSH access for PRINT weblogic"
	},
	"4" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.219.33.34/32"]
		description			= "SSH access for PRINT weblogic"
	},
	"5" = {
		from_port			= 446
		to_port				= 446
		protocol			= "tcp"
		cidr_blocks			= ["10.219.98.128/32"]
		description			= "PRODSYS7 access"
	},
	"6" = {
		from_port			= all
		to_port				= all
		protocol			= "icmp"
		cidr_blocks			= ["10.245.72.125/32"]
		description			= "ICMP"
	},
	"7" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["172.21.148.0/24"]
		description			= "SSH access for Franklin Office"
	},
	"8" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.141.0.0/16"]
		description			= "SSH access for FMG Network"
	},
	"9" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["202.168.90.114/32"]
		description			= "HTTPS From Virtusa - Navalur Tunnel"
	},
	"10" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.10.12/32"]
		description			= "SSH for Jenkins Shared"
	},
	"11" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.80/32"]
		description			= "SSH access for CrushFTP Primary Instance Access"
	},
	"12" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.245.212.125/32"]
		description			= "SSH for PRODCBU7"
	},
	"13" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.11.12/32"]
		description			= "SSH For DevOps Server Node 2"
	},
	"14" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.31.164/32"]
		description			= "CrushFTP Secondary Instance Access"
	},
	"15" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "SSH From Palo VPN"
	},
	"16" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["172.21.150.0/24"]
		description			= "SSH access for FMG Network"
	},
	"17" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.33.98.128/32"]
		description			= "SSH From Prodsys7"
	},
	"18" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.11.11/32"]
		description			= "SSH for Git-Runner"
	},
	"19" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.219.98.128/32"]
		description			= "SSH for PRODSYS7"
	},
	"20" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.245.72.125/32"]
		description			= "SSH for PRODCBU7 (DR Server)"
	},
	"21" = {
		from_port			= all
		to_port				= all
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.227/32"]
		description			= "Qlik Access"
	},
	"22" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "SSH From Private Subnets PCI"
	},
	"23" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "HTTPS From Private Subnets PCI"
	},
	"24" = {
		from_port			= 2049
		to_port				= 2049
		protocol			= "https"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "NFS From Private Subnets PCI"
	},
	"25" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["202.168.90.114/32"]
		description			= "SSH From Virtusa - Navalur Tunnel"
	},
	"26" = {
		from_port			= 446
		to_port				= 446
		protocol			= "tcp"
		cidr_blocks			= ["10.245.212.125/32"]
		description			= "DB2 Access for PRODCBU7"
	},
	"27" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "HTTPS From Palo VPN"
	},
	"28" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.141.0.0/16"]
		description			= "HTTPS From FMG Network"
	},
	"29" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["172.21.148.0/24"]
		description			= "HTTPS for Franklin Office"
	},
	"30" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["172.21.152.0/24"]
		description			= "Franklin Office 5th Floor"
	},
	"31" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["172.21.150.0/24"]
		description			= "HTTPS for Franklin Office"
	},
	"32" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.153.33.58/32"]
		description			= "HTTPS for weblogic network"
	},
	"33" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["172.21.146.0/24"]
		description			= "HTTPS for PRINT team"
	},
	"34" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.34/32"]
		description			= "HTTPS for PRINT Webl"
	},
	"35" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.33/32"]
		description			= "HTTPS for PRINT Webl"
	},
	"36" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.32/32"]
		description			= "HTTPS For WebLogic 2"
	},
	"37" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.84/32"]
		description			= "HTTPS For Captiva 2"
	},
	"38" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.67/32"]
		description			= "HTTPS For Captiva 3"
	},
	"39" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.31/32"]
		description			= "HTTPS For WebLogic 1"
	},
	"40" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.82/31"]
		description			= "HTTPS For Captiva 1"
	},
	"41" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.153.31.164/32"]
		description			= "CrushFTP Secondary Stage"
	},
	"42" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.31.164/32"]
		description			= "CrushFTP Secondary Stage"
	},
	"43" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.84/32"]
		description			= "HTTPS For Captiva 2"
	},
	"44" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.33.67/32"]
		description			= "HTTPS For Captiva 3"
	},
	"45" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.245.212.125/32"]
		description			= "HTTPS From Prodcbu7"
	},
	"46" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.219.98.128/32"]
		description			= "HTTPS From Prodsys7"
	},
	"47" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["172.21.144.0/24"]
		description			= "HTTPS For Franklin Office"
	},
	"48" = {
		from_port			= 5000
		to_port				= 5000
		protocol			= "tcp"
		cidr_blocks			= ["10.153.31.22/32"]
		description			= "5000 for pycharm server"
	},
	"49" = {
		from_port			= 5000
		to_port				= 5000
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.22/32"]
		description			= "5000 for pycharm server"
	},
	"50" = {
		from_port			= 5000
		to_port				= 5000
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.20/32"]
		description			= "5000 for Jboss admin"
	},
	"51" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["172.21.152.0/24"]
		description			= "SSH for Franklin Office"
	},
	"52" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.219.33.37/32"]
		description			= "SSH For EFT 1"
	},
	"53" = {
		from_port			= 443
		to_port				= 443
		protocol			= "https"
		cidr_blocks			= ["10.153.30.80/32"]
		description			= "HTTPS For CrushFTP Primary Server"
	}
}

