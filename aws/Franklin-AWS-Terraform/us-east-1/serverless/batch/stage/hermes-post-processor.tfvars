hermes_post_processor_bool = true
ce_name = "hermes-post-processor-compute-env-stage"
ce_cr_max_vcpus = 4
ce_cr_sg_list = ["sg-0b2cbcc29401d05ef"]
ce_cr_subnet_list = ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
ce_cr_type = "FARGATE"
ce_service_role = "arn:aws:iam::702230634984:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "07312023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jq_name = "hermes-post-processor-job-queue-stage"

jd_timeout = 600
jd_container_command = ["post_processor_job", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-batch-processor-stage"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
jd_container_volume_name = "fmg-serverless-efs"
jd_container_volume_fs_id = "fs-07b5805e9ed9611a9"
jd_container_volume_root_dir = "/"
jd_container_mountpoint_container_path = "/common"
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
	"LastUpdated"			= "09082023"
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
	"CreatedOn"				= "07312023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
event_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-stage"

jd_name = "hermes-post-processor-job-definition-stage"
jd_container_vcpu = "2.0"
jd_container_memory = "4096"
eb_rule_name = "hermes-post-processor-rule-stage"
eb_rule_event_pattern = {
	detail = {
		bucket = {
			name = ["hermes-batch-processor-stage"]
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
event_target_job_name = "Hermes-Post-Processor-Job-Stage"
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"10\"},{\"Name\":\"HERMES_PYCHARM_BUCKET_NAME\",\"Value\":\"pycharm-serverless-stage\"},{\"Name\":\"HERMES_PYCHARM_OBJECT_PATH\",\"Value\":\"hermes2/pycharm_incoming/payload/batch/\"},{\"Name\":\"JAVA_TOOL_OPTIONS\",\"Value\":\"-XX:InitialHeapSize=2g -XX:MaxHeapSize=4g\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"},{\"Name\":\"PYCHARM_DOCKER_BATCH_WAY\",\"Value\":\"TRUE\"}]}}"