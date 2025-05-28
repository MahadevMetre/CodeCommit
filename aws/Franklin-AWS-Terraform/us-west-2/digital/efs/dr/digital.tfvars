efs_name = "EFS-Digital"
efs_perf_mode = "generalPurpose"
efs_throughput_mode = "bursting"
efs_encrypted = true
efs_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03172023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03172023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "EFS-Digital-App"
}

efs_security_group_name = "Efs_digital_access_group"
vpc_id = "vpc-0e79e26eb537504d0"
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/b4e458ee-5850-4134-8e52-d9e1e379b665"
subnet_id = "subnet-0b927d24fec28d40b"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0a1d3486597f552fe"