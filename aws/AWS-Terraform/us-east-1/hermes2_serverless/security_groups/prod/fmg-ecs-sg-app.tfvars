sg_name				= "fmg-ecs-sg-app-prod"
sg_description		= "Security group to allow inbound to ecs service from alb"
sg_vpc_id			= "vpc-021b1f680addbd6db"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11082023"
	"Name"					= "fmg-ecs-sg-app-prod"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
	"1" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.2.0/23"]
		description			= "Port 8080 From Private Subnets Prod"
	},
	"2" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.153.2.0/23"]
		description			= "HTTP From Private Subnets Prod"
	},
	"3" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "SSH From Palo VPN"
	},
	"4" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.10.219/32"]
		description			= "Verinext-SSH from Shared Prv Instance"
	}
}