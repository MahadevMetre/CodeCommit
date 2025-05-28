hermes_addr_standardization_bool = true
ce_name = "hermes-address-standardization-compute-env-qa"
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

jq_name = "hermes-address-standardization-job-queue-qa"

jd_name = "hermes-address-standardization-job-definition-qa"
jd_timeout = 600
jd_container_command = ["address_standardization_job", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-qa"
jd_container_exec_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
jd_tags = {
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

eb_rule_name = "hermes-address-standardization-rule-qa"
eb_rule_tags = {
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
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-qa"]
		},
		object = {
			key = [
				{
					prefix = "address_standardization/incoming/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
event_target_job_name = "Hermes-Address-Standardization-Job-QA"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:634621569833:hermes-serverless-dlq-qa"