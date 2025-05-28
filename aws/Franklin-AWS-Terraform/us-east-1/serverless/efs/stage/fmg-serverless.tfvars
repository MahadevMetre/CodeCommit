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
	"CreatedOn" = "09292023"
	"DataClassification" = "None"
	"Department" = "HMS2"
	"Infrastructure" = "False"
	"LastUpdated" = "09292023"
	"Name" = "EFS-Serverless-Apps"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:702230634984:key/mrk-b8eef55d2c20426db52f6a02431ad1ac"
subnet_id = "subnet-0ed61b6beb807094e"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-076a071fa0723c80e"

efs_security_group_name = "efs-serverless-sg-stage"
vpc_id = "vpc-0051d323df13c7db3"
sg_ingress_rules = {
 "1" = {
  from_port   = 2049
  to_port     = 2049
  protocol    = "tcp"
  cidr_blocks = ["10.153.18.0/23"]
  description = "NFS From Private Subnets Stage"
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
	"Name" = "efs-serverless-sg-stage"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}