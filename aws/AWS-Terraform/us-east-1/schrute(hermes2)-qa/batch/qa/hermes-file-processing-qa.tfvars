hermes_file_processing_bool = true
ce_name = "hermes-file-processing-compute-env-qa"
ce_cr_max_vcpus = 4
ce_cr_sg_list = ["sg-0577a75fbc20b0cfb"]
ce_cr_subnet_list = ["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::634621569833:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "05202024"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "05202024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-file-processing-job-queue-qa"