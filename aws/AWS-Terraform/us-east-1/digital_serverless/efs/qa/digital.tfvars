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
	"CreatedOn" = "09022024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09022024"
	"Name" = "EFS-Digital-App"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}
kms_key_id = "arn:aws:kms:us-east-1:634621569833:key/2946c3ae-1329-4617-94b4-22ba181e4bcf"
subnet_id = "subnet-0aeea9e95e8137ce8"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-059a28296ee46f82f" 

efs_security_group_name = "digital-efs-mount-target-qa"
vpc_id = "vpc-00f27e42f4b836922"
efs_sg_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09022024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09022024"
	"Name" = "digital-efs-mount-target-qa"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
}

