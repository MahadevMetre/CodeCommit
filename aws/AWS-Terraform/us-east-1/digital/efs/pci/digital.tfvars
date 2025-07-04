efs_name = "EFS-Digital"
efs_perf_mode = "generalPurpose"
efs_throughput_mode = "bursting"
efs_encrypted = true
efs_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "12242021"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09272023"
	"Name" = "EFS-Digital-App"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:601751840347:key/01bc822e-5ae8-43ab-b3fe-38d2ffb10c28"
subnet_id = "subnet-0a33ed77fe2cfb6ef"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0a797df6e7dcae3db"

efs_security_group_name = "Efs_digital_access_group"
vpc_id = "vpc-00bd4d2758879b1e0"
efs_sg_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "12242021"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09272023"
	"Name" = "Efs_digital_access_group"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}