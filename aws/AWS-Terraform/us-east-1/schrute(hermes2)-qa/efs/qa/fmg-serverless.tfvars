efs_name = "EFS-Serverless-Apps"
efs_perf_mode = "generalPurpose"
efs_throughput_mode = "bursting"
efs_encrypted = true
efs_tags = {
	"ApplicationName" = "Hermes2.0"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "05172024"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "05172024"
	"Name" = "EFS-Serverless-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:634621569833:key/mrk-564a942fa8a24f9c9f439043dbc52221"
subnet_id = "subnet-059a28296ee46f82f"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0aeea9e95e8137ce8"

efs_security_group_name = "efs-serverless-sg-qa"
vpc_id = "	vpc-00f27e42f4b836922"
sg_ingress_rules = {
 "1" = {
  from_port   = 2049
  to_port     = 2049
  protocol    = "tcp"
  cidr_blocks = ["10.153.22.0/24"]
  description = "NFS From Private Subnets qa"
 }
}
efs_sg_tags = {
	"ApplicationName" = "Hermes2.0"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "05202024"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "05202024"
	"Name" = "efs-serverless-sg-qa"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}