hermes_file_processing_bool = true
ce_name = "hermes-file-processing-compute-env-dev"
ce_cr_max_vcpus = 4
ce_cr_sg_list = ["sg-03ec84b14631c5168"]
ce_cr_subnet_list = ["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::116762271881:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08142023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08142023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-file-processing-job-queue-dev"