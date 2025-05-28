sg_name				= "efs-sg-qa"
sg_description		= "Security group to allow inbound to efs mount server"
sg_vpc_id			= "vpc-00f27e42f4b836922"
sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08092024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08092024"
	"Name"					= "efs-sg-qa"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
sg_ingress_rules = {
	"1" = {
		from_port			= 2049
		to_port				= 2049
		protocol			= "tcp"
		cidr_blocks			= ["10.153.42.0/23"]
		description			= "NFS From Private Subnets DR"
	},
	"2" = {
		from_port			= 2049
		to_port				= 2049
		protocol			= "tcp"
		cidr_blocks			= ["10.153.22.0/23"]
		description			= "NFS From Private Subnets qa"
	},

}