hermes_transformer_bool = true
ce_name = "hermes-transformer-compute-env-dr"
ce_cr_max_vcpus = 8
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

jq_name = "hermes-transformer-job-queue-dr"

jd_name = "hermes-transformer-job-definition-dr"
jd_timeout = 600
jd_container_command = ["transformer_job", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-dr"
jd_container_exec_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_job_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
jd_tags = {
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

eb_rule_name = "hermes-transformer-rule-dr"
eb_rule_tags = {
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
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-dr"]
		},
		object = {
			key = [
				{
					prefix = "transformer/letter/incoming/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
event_target_job_name = "Hermes-Transformer-Job-DR"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"},{\"Name\":\"PYCHARM_DOCKER_BATCH_WAY\",\"Value\":\"TRUE\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-west-2:214946096060:hermes-serverless-dlq-dr"