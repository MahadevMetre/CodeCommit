hermes_pycharm_batch_processor_xlarge_bool = true
hermes_pycharm_batch_processor_2xlarge_bool = true
hermes_pycharm_batch_processor_4xlarge_bool = true
ce_cr_allocation_strategy = "BEST_FIT_PROGRESSIVE"
ce_cr_ec2_key_pair = "fmg-serverless-dev"
ce_cr_instance_role = "arn:aws:iam::116762271881:instance-profile/ecsInstanceRole"
ce_cr_sg_list = ["sg-03ec84b14631c5168"]
ce_cr_subnet_list = ["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
ce_cr_type = "EC2"
ce_cr_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "hermes-pycharm-batch-processor-cslt-compute-env-dev"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"Name"					= "Hermes-PyCharm-Batch-Processor-CSLT-EC2-Dev"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
ce_service_role = "arn:aws:iam::116762271881:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
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

jd_container_image = "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:pycharm-batch-dev"
jd_container_exec_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
jd_container_job_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
jd_container_volume_name = "fmg-serverless-efs"
jd_container_volume_fs_id = "fs-09bbdeba8e282df8d"
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
event_target_role_arn = "arn:aws:iam::116762271881:role/hermes-ecs-task-execution-role-dev"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"ENVIRONMENT\",\"Value\":\"dev\"},{\"Name\":\"INSCHECK_OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery/internal/checks\"},{\"Name\":\"LOG_FILE\",\"Value\":\"pycharm.log\"},{\"Name\":\"LOG_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/system\"},{\"Name\":\"OUTPUT_PDF_BASE_PATH\",\"Value\":\"/home/pycharm/pycharm_out\"},{\"Name\":\"OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery\"},{\"Name\":\"PAYLOAD_DIRECTORY_ROOT\",\"Value\":\"hermes2/pycharm_incoming/payload/batch\"},{\"Name\":\"POST_PROCESSOR_INCOMING_PATH\",\"Value\":\"hermes-batch-processor-dev/post_processor/incoming\"},{\"Name\":\"SAVE_JSON_FLAG\",\"Value\":\"True\"},{\"Name\":\"SAVE_JSON_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/payloads\"},{\"Name\":\"S3_BUCKET_VALUE\",\"Value\":\"<S3BucketValue>\"},{\"Name\":\"S3_KEY_VALUE\",\"Value\":\"<S3KeyValue>\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:116762271881:hermes-serverless-dlq-dev"

// Begin pycharm-batch-processor-cslt-xlarge config
ce_name_xlarge = "hermes-pycharm-batch-processor-cslt-xlarge-compute-env-dev"
ce_cr_instance_type_xlarge = ["c7i.xlarge"]
ce_cr_max_vcpus_xlarge = 4
jq_name_xlarge = "hermes-pycharm-batch-processor-cslt-xlarge-job-queue-dev"
jd_name_xlarge = "hermes-pycharm-batch-processor-cslt-xlarge-job-definition-dev"
jd_timeout_xlarge = 1200
jd_container_vcpu_xlarge = "4"
jd_container_memory_xlarge = "7424"
eb_rule_name_xlarge = "hermes-pycharm-batch-processor-cslt-xlarge-rule-dev"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dev"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cslt/800/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_xlarge = "Hermes-PyCharm-Batch-Processor-CSLT-XLarge-Job-Dev"
// End pycharm-batch-processor-cslt-xlarge config
// Begin pycharm-batch-processor-cslt-2xlarge config
ce_name_2xlarge = "hermes-pycharm-batch-processor-cslt-2xlarge-compute-env-dev"
ce_cr_instance_type_2xlarge = ["c7i.2xlarge"]
ce_cr_max_vcpus_2xlarge = 8
jq_name_2xlarge = "hermes-pycharm-batch-processor-cslt-2xlarge-job-queue-dev"
jd_name_2xlarge = "hermes-pycharm-batch-processor-cslt-2xlarge-job-definition-dev"
jd_timeout_2xlarge = 1800
jd_container_vcpu_2xlarge = "8"
jd_container_memory_2xlarge = "14848"
eb_rule_name_2xlarge = "hermes-pycharm-batch-processor-cslt-2xlarge-rule-dev"
eb_rule_event_pattern_2xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dev"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cslt/1600/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_2xlarge = "Hermes-PyCharm-Batch-Processor-CSLT-2XLarge-Job-Dev"
// End pycharm-batch-processor-cslt-2xlarge config
// Begin pycharm-batch-processor-cslt-4xlarge config
ce_name_4xlarge = "hermes-pycharm-batch-processor-cslt-4xlarge-compute-env-dev"
ce_cr_instance_type_4xlarge = ["c7i.4xlarge"]
ce_cr_max_vcpus_4xlarge = 16
jq_name_4xlarge = "hermes-pycharm-batch-processor-cslt-4xlarge-job-queue-dev"
jd_name_4xlarge = "hermes-pycharm-batch-processor-cslt-4xlarge-job-definition-dev"
jd_timeout_4xlarge = 3000
jd_container_vcpu_4xlarge = "16"
jd_container_memory_4xlarge = "29696"
eb_rule_name_4xlarge = "hermes-pycharm-batch-processor-cslt-4xlarge-rule-dev"
eb_rule_event_pattern_4xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dev"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cslt/3200/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_4xlarge = "Hermes-PyCharm-Batch-Processor-CSLT-4XLarge-Job-Dev"
// End pycharm-batch-processor-cslt-4xlarge config
// Begin pycharm-batch-processor-cslt-8xlarge config
ce_name_8xlarge = "hermes-pycharm-batch-processor-cslt-8xlarge-compute-env-dev"
ce_cr_instance_type_8xlarge = ["c7i.8xlarge"]
ce_cr_max_vcpus_8xlarge = 32
jq_name_8xlarge = "hermes-pycharm-batch-processor-cslt-8xlarge-job-queue-dev"
jd_name_8xlarge = "hermes-pycharm-batch-processor-cslt-8xlarge-job-definition-dev"
jd_timeout_8xlarge = 4800
jd_container_vcpu_8xlarge = "32"
jd_container_memory_8xlarge = "59392"
eb_rule_name_8xlarge = "hermes-pycharm-batch-processor-cslt-8xlarge-rule-dev"
eb_rule_event_pattern_8xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dev"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cslt/6400/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_8xlarge = "Hermes-PyCharm-Batch-Processor-CSLT-8XLarge-Job-Dev"
// End pycharm-batch-processor-cslt-8xlarge config