hermes_file_processing_bool = true
ce_name = "hermes-file-processing-compute-env-dr"
ce_cr_max_vcpus = 16
ce_cr_sg_list = ["sg-0a12c44f2b53a9dba"]
ce_cr_subnet_list = ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::214946096060:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "02232024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "02232024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-file-processing-job-queue-dr"