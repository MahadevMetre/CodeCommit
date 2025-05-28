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
	"CreatedOn" = "09252023"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "09252023"
	"Name" = "EFS-Serverless-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:116762271881:key/mrk-bd048ba90cde4b00b1f3b951756aa0c9"
subnet_id = "subnet-06291ceaa523f684c"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0734d8f28467d319f"

efs_security_group_name = "efs-serverless-sg-dev"
vpc_id = "vpc-00ff8e33839358d28"
sg_ingress_rules = {
 "1" = {
  from_port   = 2049
  to_port     = 2049
  protocol    = "tcp"
  cidr_blocks = ["10.153.14.0/23"]
  description = "NFS From Private Subnets Dev"
 }
}
efs_sg_tags = {
	"ApplicationName" = "Hermes2.0"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09252023"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "09252023"
	"Name" = "efs-serverless-sg-dev"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}