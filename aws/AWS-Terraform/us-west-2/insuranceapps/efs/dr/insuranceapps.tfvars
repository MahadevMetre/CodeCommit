efs_name = "EFS-Insurance-Apps-DR"
efs_perf_mode = "generalPurpose"
efs_throughput_mode = "bursting"
efs_encrypted = true
efs_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "01162023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "EFS-Insurance-Apps-DR"
}

efs_security_group_name = "Efs_access_group"
vpc_id = "vpc-0e79e26eb537504d0"
kms_key_id = "arn:aws:kms:us-west-2:214946096060:key/54aea680-6661-4008-a514-516ddcf686aa"
subnet_id = "subnet-0b927d24fec28d40b"
efs_attach_to_second_subnet = true
subnet2_id = "subnet-0a1d3486597f552fe"