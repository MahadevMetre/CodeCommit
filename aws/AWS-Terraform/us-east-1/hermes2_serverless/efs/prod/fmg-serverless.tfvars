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
	"CreatedOn" = "09272023"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "09272023"
	"Name" = "EFS-Serverless-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:361469336240:key/mrk-b7f3c92bbf734424b1e3475b241cf097"
subnet_id = "subnet-0052ab706c1f947c9"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-011ed7a9e6d735228"

efs_security_group_name = "efs-serverless-sg-prod"
vpc_id = "vpc-021b1f680addbd6db"
sg_ingress_rules = {
 "1" = {
  from_port   = 2049
  to_port     = 2049
  protocol    = "tcp"
  cidr_blocks = ["10.153.2.0/23"]
  description = "NFS From Private Subnets Prod"
 }
}
efs_sg_tags = {
	"ApplicationName" = "Hermes2.0"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09272023"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "09272023"
	"Name" = "efs-serverless-sg-prod"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}