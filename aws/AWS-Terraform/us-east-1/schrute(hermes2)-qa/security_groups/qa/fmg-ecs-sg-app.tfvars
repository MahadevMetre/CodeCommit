sg_name				= "fmg-ecs-sg-app-qa"
sg_description		= "Security group to allow inbound to ecs service from alb"
sg_vpc_id			= "vpc-00f27e42f4b836922"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"Name"					= "fmg-ecs-sg-app-qa"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
	"1" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.23.0/24"]
		description			= "Port 8080 From Private Subnets qa"
	},
	"2" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.153.22.0/24"]
		description			= "HTTP From Private Subnets qa"
	},
	"3" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "SSH From Palo VPN"
	}
}