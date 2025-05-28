hermes_file_processing_bool = true
ce_name = "hermes-file-processing-compute-env-prod"
ce_cr_max_vcpus = 16
ce_cr_sg_list = ["sg-03e2f86c64383bf88"]
ce_cr_subnet_list = ["subnet-0052ab706c1f947c9", "subnet-011ed7a9e6d735228"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::361469336240:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08222023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-file-processing-job-queue-prod"