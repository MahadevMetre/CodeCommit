hermes_post_processor_bool = true
ce_name = "hermes-post-processor-compute-env-prod"
ce_cr_max_vcpus = 8
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

jq_name = "hermes-post-processor-job-queue-prod"

jd_timeout = 600
jd_container_command = ["post_processor_job", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "361469336240.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-prod"
jd_container_exec_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
jd_container_job_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
jd_container_volume_name = "fmg-serverless-efs"
jd_container_volume_fs_id = "fs-0f1da5ae990ffab56"
jd_container_volume_root_dir = "/"
jd_container_mountpoint_container_path = "/common"
jd_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09272023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

eb_rule_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09272023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
event_target_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
sqs_dlq_arn = "arn:aws:sqs:us-east-1:361469336240:hermes-serverless-dlq-prod"

jd_name = "hermes-post-processor-job-definition-prod"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
eb_rule_name = "hermes-post-processor-rule-prod"
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-prod"]
		},
		object = {
			key = [
				{
					prefix = "post_processor/incoming/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name = "Hermes-Post-Processor-Job-Prod"
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"10\"},{\"Name\":\"HERMES_PYCHARM_BUCKET_NAME\",\"Value\":\"pycharm-serverless-prod\"},{\"Name\":\"HERMES_PYCHARM_OBJECT_PATH\",\"Value\":\"hermes2/pycharm_incoming/payload/batch/\"},{\"Name\":\"JAVA_TOOL_OPTIONS\",\"Value\":\"-XX:InitialHeapSize=2g -XX:MaxHeapSize=4g\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"},{\"Name\":\"PYCHARM_DOCKER_BATCH_WAY\",\"Value\":\"TRUE\"}]}}"