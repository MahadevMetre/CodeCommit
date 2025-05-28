hermes_pycharm_batch_processor_xlarge_bool = true
hermes_pycharm_batch_processor_2xlarge_bool = true
ce_cr_allocation_strategy = "BEST_FIT_PROGRESSIVE"
ce_cr_ec2_key_pair = "fmg-serverless-prod"
ce_cr_instance_role = "arn:aws:iam::361469336240:instance-profile/ecsInstanceRole"
ce_cr_sg_list = ["sg-03e2f86c64383bf88"]
ce_cr_subnet_list = ["subnet-0052ab706c1f947c9", "subnet-011ed7a9e6d735228"]
ce_cr_type = "EC2"
ce_cr_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "hermes-pycharm-batch-processor-cpkt-compute-env-prod"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"Name"					= "Hermes-PyCharm-Batch-Processor-CPKT-EC2-Prod"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
ce_service_role = "arn:aws:iam::361469336240:role/aws-service-role/batch.amazonaws.com/AWSServiceRoleForBatch"
ce_type = "MANAGED"
ce_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "10032023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10032023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

jd_container_image = "361469336240.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:pycharm-batch-prod"
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
	"CreatedOn"				= "10032023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10032023"
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
	"CreatedOn"				= "10032023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "10032023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
event_target_role_arn = "arn:aws:iam::361469336240:role/hermes-ecs-task-execution-role-prod"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"ENVIRONMENT\",\"Value\":\"prod\"},{\"Name\":\"INSCHECK_OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery/internal/checks\"},{\"Name\":\"LOG_FILE\",\"Value\":\"pycharm.log\"},{\"Name\":\"LOG_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/system\"},{\"Name\":\"OUTPUT_PDF_BASE_PATH\",\"Value\":\"/home/pycharm/pycharm_out\"},{\"Name\":\"OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery\"},{\"Name\":\"PAYLOAD_DIRECTORY_ROOT\",\"Value\":\"hermes2/pycharm_incoming/payload/batch\"},{\"Name\":\"POST_PROCESSOR_INCOMING_PATH\",\"Value\":\"hermes-batch-processor-prod/post_processor/incoming\"},{\"Name\":\"SAVE_JSON_FLAG\",\"Value\":\"True\"},{\"Name\":\"SAVE_JSON_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/payloads\"},{\"Name\":\"S3_BUCKET_VALUE\",\"Value\":\"<S3BucketValue>\"},{\"Name\":\"S3_KEY_VALUE\",\"Value\":\"<S3KeyValue>\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:361469336240:hermes-serverless-dlq-prod"

// Begin pycharm-batch-processor-cpkt-xlarge config
ce_name_xlarge = "hermes-pycharm-batch-processor-cpkt-xlarge-compute-env-prod"
ce_cr_instance_type_xlarge = ["c7i.xlarge"]
ce_cr_max_vcpus_xlarge = 4
jq_name_xlarge = "hermes-pycharm-batch-processor-cpkt-xlarge-job-queue-prod"
jd_name_xlarge = "hermes-pycharm-batch-processor-cpkt-xlarge-job-definition-prod"
jd_timeout_xlarge = 1200
jd_container_vcpu_xlarge = "4"
jd_container_memory_xlarge = "7424"
eb_rule_name_xlarge = "hermes-pycharm-batch-processor-cpkt-xlarge-rule-prod"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-prod"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cpkt/800/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_xlarge = "Hermes-PyCharm-Batch-Processor-CPKT-XLarge-Job-Prod"
// End pycharm-batch-processor-cpkt-xlarge config
// Begin pycharm-batch-processor-cpkt-2xlarge config
ce_name_2xlarge = "hermes-pycharm-batch-processor-cpkt-2xlarge-compute-env-prod"
ce_cr_instance_type_2xlarge = ["c7i.2xlarge"]
ce_cr_max_vcpus_2xlarge = 8
jq_name_2xlarge = "hermes-pycharm-batch-processor-cpkt-2xlarge-job-queue-prod"
jd_name_2xlarge = "hermes-pycharm-batch-processor-cpkt-2xlarge-job-definition-prod"
jd_timeout_2xlarge = 1800
jd_container_vcpu_2xlarge = "8"
jd_container_memory_2xlarge = "14848"
eb_rule_name_2xlarge = "hermes-pycharm-batch-processor-cpkt-2xlarge-rule-prod"
eb_rule_event_pattern_2xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-prod"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cpkt/1600/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_2xlarge = "Hermes-PyCharm-Batch-Processor-CPKT-2XLarge-Job-Prod"
// End pycharm-batch-processor-cpkt-2xlarge config
// Begin pycharm-batch-processor-cpkt-4xlarge config
ce_name_4xlarge = "hermes-pycharm-batch-processor-cpkt-4xlarge-compute-env-prod"
ce_cr_instance_type_4xlarge = ["c7i.4xlarge"]
ce_cr_max_vcpus_4xlarge = 16
jq_name_4xlarge = "hermes-pycharm-batch-processor-cpkt-4xlarge-job-queue-prod"
jd_name_4xlarge = "hermes-pycharm-batch-processor-cpkt-4xlarge-job-definition-prod"
jd_timeout_4xlarge = 3000
jd_container_vcpu_4xlarge = "16"
jd_container_memory_4xlarge = "29696"
eb_rule_name_4xlarge = "hermes-pycharm-batch-processor-cpkt-4xlarge-rule-prod"
eb_rule_event_pattern_4xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-prod"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cpkt/3200/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_4xlarge = "Hermes-PyCharm-Batch-Processor-CPKT-4XLarge-Job-Prod"
// End pycharm-batch-processor-cpkt-4xlarge config
// Begin pycharm-batch-processor-cpkt-8xlarge config
ce_name_8xlarge = "hermes-pycharm-batch-processor-cpkt-8xlarge-compute-env-prod"
ce_cr_instance_type_8xlarge = ["c7i.8xlarge"]
ce_cr_max_vcpus_8xlarge = 32
jq_name_8xlarge = "hermes-pycharm-batch-processor-cpkt-8xlarge-job-queue-prod"
jd_name_8xlarge = "hermes-pycharm-batch-processor-cpkt-8xlarge-job-definition-prod"
jd_timeout_8xlarge = 4800
jd_container_vcpu_8xlarge = "32"
jd_container_memory_8xlarge = "59392"
eb_rule_name_8xlarge = "hermes-pycharm-batch-processor-cpkt-8xlarge-rule-prod"
eb_rule_event_pattern_8xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-prod"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/cpkt/6400/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_8xlarge = "Hermes-PyCharm-Batch-Processor-CPKT-8XLarge-Job-Prod"
// End pycharm-batch-processor-cpkt-8xlarge config