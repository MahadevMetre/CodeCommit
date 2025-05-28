efs_name = "EFS-App-QA"
efs_perf_mode = "generalPurpose"
efs_throughput_mode = "bursting"
efs_encrypted = true
efs_tags = {
	"ApplicationName" = "AthenaNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09182024"
	"DataClassification" = "Low"
	"Department" = "ANG"
	"Infrastructure" = "False"
	"LastUpdated" = "09182024"
	"Name" = "EFS-App-QA"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:634621569833:key/mrk-564a942fa8a24f9c9f439043dbc52221"
subnet_id = "subnet-059a28296ee46f82f"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0aeea9e95e8137ce8"

efs_security_group_name = "EFS-App-SG-QA"
vpc_id = "vpc-00f27e42f4b836922"
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
	}
}
efs_sg_tags = {
	"ApplicationName" = "AthenaNextGen"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09182024"
	"DataClassification" = "Low"
	"Department" = "ANG"
	"Infrastructure" = "False"
	"LastUpdated" = "09182024"
	"Name" = "EFS-App-Stage-SG"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}