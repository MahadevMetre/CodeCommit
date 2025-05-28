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
	"CreatedOn" = "02232024"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "02232024"
	"Name" = "EFS-Serverless-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/mrk-90b8030074e5414cbfa629a8472f4e3c"
subnet_id = "subnet-0b927d24fec28d40b"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0a1d3486597f552fe"

efs_security_group_name = "efs-serverless-sg-dr"
vpc_id = "vpc-0e79e26eb537504d0"
sg_ingress_rules = {
 "1" = {
  from_port   = 2049
  to_port     = 2049
  protocol    = "tcp"
  cidr_blocks = ["10.153.42.0/23"]
  description = "NFS From Private Subnets DR"
 }
}
efs_sg_tags = {
	"ApplicationName" = "Hermes2.0"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "02232024"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "02232024"
	"Name" = "efs-serverless-sg-dr"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}