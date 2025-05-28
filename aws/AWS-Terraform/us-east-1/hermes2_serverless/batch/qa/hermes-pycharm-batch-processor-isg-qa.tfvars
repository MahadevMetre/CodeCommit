hermes_pycharm_batch_processor_xlarge_bool = true
ce_cr_allocation_strategy = "BEST_FIT_PROGRESSIVE"
ce_cr_ec2_key_pair = "fmg-serverless-stage"
ce_cr_instance_role = "arn:aws:iam::702230634984:instance-profile/ecsInstanceRole"
ce_cr_sg_list = ["sg-0b2cbcc29401d05ef"]
ce_cr_subnet_list = ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
ce_cr_type = "EC2"
ce_cr_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "hermes-pycharm-batch-processor-isg-compute-env-qa"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"Name"					= "Hermes-PyCharm-Batch-Processor-ISG-EC2-QA"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
ce_service_role = "arn:aws:iam::702230634984:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jd_timeout = 120
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:pycharm-batch-qa"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
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
	"CreatedOn"				= "09182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182023"
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
	"CreatedOn"				= "09182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09182023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
event_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"ENVIRONMENT\",\"Value\":\"qa\"},{\"Name\":\"INSCHECK_OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery/internal/checks\"},{\"Name\":\"LOG_FILE\",\"Value\":\"pycharm.log\"},{\"Name\":\"LOG_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/system\"},{\"Name\":\"OUTPUT_PDF_BASE_PATH\",\"Value\":\"/home/pycharm/pycharm_out\"},{\"Name\":\"OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery\"},{\"Name\":\"PAYLOAD_DIRECTORY_ROOT\",\"Value\":\"hermes2/pycharm_incoming/payload/batch\"},{\"Name\":\"POST_PROCESSOR_INCOMING_PATH\",\"Value\":\"hermes-batch-processor-qa/post_processor/incoming\"},{\"Name\":\"SAVE_JSON_FLAG\",\"Value\":\"True\"},{\"Name\":\"SAVE_JSON_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/payloads\"},{\"Name\":\"S3_BUCKET_VALUE\",\"Value\":\"<S3BucketValue>\"},{\"Name\":\"S3_KEY_VALUE\",\"Value\":\"<S3KeyValue>\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-qa"

// Begin pycharm-batch-processor-isg-xlarge config
ce_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-compute-env-qa"
ce_cr_instance_type_xlarge = ["c7i.xlarge"]
ce_cr_max_vcpus_xlarge = 4
jq_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-job-queue-qa"
jd_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-job-definition-qa"
jd_timeout_xlarge = 600
jd_container_vcpu_xlarge = "4"
jd_container_memory_xlarge = "7424"
eb_rule_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-rule-qa"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-qa"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/isg/800/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_xlarge = "Hermes-PyCharm-Batch-Processor-ISG-XLarge-Job-QA"
// End pycharm-batch-processor-isg-xlarge config