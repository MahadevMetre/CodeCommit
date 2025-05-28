hermes_addr_standardization_bool = true
ce_name = "hermes-address-standardization-compute-env-dev"
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
	"CreatedOn"				= "07242023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09072023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-address-standardization-job-queue-dev"

jd_name = "hermes-address-standardization-job-definition-dev"
jd_timeout = 600
jd_container_command = ["address_standardization_job", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-dev"
jd_container_exec_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
jd_container_job_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
jd_container_vcpu = "1.0"
jd_container_memory = "2048"
jd_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08012023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09072023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

eb_rule_name = "hermes-address-standardization-rule-dev"
eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07272023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09072023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-dev"]
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
event_target_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
event_target_job_name = "Hermes-Address-Standardization-Job-Dev"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:116762271881:hermes-serverless-dlq-dev"