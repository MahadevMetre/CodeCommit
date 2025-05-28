hermes_pycharm_batch_processor_xlarge_bool = true
hermes_pycharm_batch_processor_2xlarge_bool = true
hermes_pycharm_batch_processor_4xlarge_bool = true
ce_cr_allocation_strategy = "BEST_FIT_PROGRESSIVE"
ce_cr_ec2_key_pair = "fmg-serverless-dr"
ce_cr_instance_role = "arn:aws:iam::214946096060:instance-profile/ecsInstanceRole"
ce_cr_sg_list = ["sg-0a12c44f2b53a9dba"]
ce_cr_subnet_list = ["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
ce_cr_type = "EC2"
ce_cr_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "hermes-pycharm-batch-processor-isg-compute-env-dr"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"Name"					= "Hermes-PyCharm-Batch-Processor-ISG-EC2-DR"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
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

jd_container_image = "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:pycharm-batch-dr"
jd_container_exec_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_job_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_volume_name = "fmg-serverless-efs"
jd_container_volume_fs_id = "fs-0f35f9eb48d423837"
jd_container_volume_root_dir = "/"
jd_container_mountpoint_container_path = "/common"
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
event_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
et_transformer_input_paths = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"ENVIRONMENT\",\"Value\":\"dr\"},{\"Name\":\"INSCHECK_OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery/internal/checks\"},{\"Name\":\"LOG_FILE\",\"Value\":\"pycharm.log\"},{\"Name\":\"LOG_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/system\"},{\"Name\":\"OUTPUT_PDF_BASE_PATH\",\"Value\":\"/home/pycharm/pycharm_out\"},{\"Name\":\"OUTPUT_PDF_ROOT\",\"Value\":\"hermes2/outgoing/delivery\"},{\"Name\":\"PAYLOAD_DIRECTORY_ROOT\",\"Value\":\"hermes2/pycharm_incoming/payload/batch\"},{\"Name\":\"POST_PROCESSOR_INCOMING_PATH\",\"Value\":\"hermes-batch-processor-dr/post_processor/incoming\"},{\"Name\":\"SAVE_JSON_FLAG\",\"Value\":\"True\"},{\"Name\":\"SAVE_JSON_LOC\",\"Value\":\"/common/logs/pycharm/batch/{DYNAMIC_FOLDER_NAME}/payloads\"},{\"Name\":\"S3_BUCKET_VALUE\",\"Value\":\"<S3BucketValue>\"},{\"Name\":\"S3_KEY_VALUE\",\"Value\":\"<S3KeyValue>\"}]}}"
sqs_dlq_arn = "arn:aws:sqs:us-west-2:214946096060:hermes-serverless-dlq-dr"

// Begin pycharm-batch-processor-isg-xlarge config
ce_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-compute-env-dr"
ce_cr_instance_type_xlarge = ["c7i.xlarge"]
ce_cr_max_vcpus_xlarge = 4
jq_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-job-queue-dr"
jd_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-job-definition-dr"
jd_timeout_xlarge = 1500
jd_container_vcpu_xlarge = "4"
jd_container_memory_xlarge = "7424"
eb_rule_name_xlarge = "hermes-pycharm-batch-processor-isg-xlarge-rule-dr"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dr"]
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
event_target_job_name_xlarge = "Hermes-PyCharm-Batch-Processor-ISG-XLarge-Job-DR"
// End pycharm-batch-processor-isg-xlarge config
// Begin pycharm-batch-processor-isg-2xlarge config
ce_name_2xlarge = "hermes-pycharm-batch-processor-isg-2xlarge-compute-env-dr"
ce_cr_instance_type_2xlarge = ["c7i.2xlarge"]
ce_cr_max_vcpus_2xlarge = 8
jq_name_2xlarge = "hermes-pycharm-batch-processor-isg-2xlarge-job-queue-dr"
jd_name_2xlarge = "hermes-pycharm-batch-processor-isg-2xlarge-job-definition-dr"
jd_timeout_2xlarge = 1800
jd_container_vcpu_2xlarge = "8"
jd_container_memory_2xlarge = "14848"
eb_rule_name_2xlarge = "hermes-pycharm-batch-processor-isg-2xlarge-rule-dr"
eb_rule_event_pattern_2xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dr"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/isg/1600/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_2xlarge = "Hermes-PyCharm-Batch-Processor-ISG-2XLarge-Job-DR"
// End pycharm-batch-processor-isg-2xlarge config
// Begin pycharm-batch-processor-isg-4xlarge config
ce_name_4xlarge = "hermes-pycharm-batch-processor-isg-4xlarge-compute-env-dr"
ce_cr_instance_type_4xlarge = ["c7i.4xlarge"]
ce_cr_max_vcpus_4xlarge = 16
jq_name_4xlarge = "hermes-pycharm-batch-processor-isg-4xlarge-job-queue-dr"
jd_name_4xlarge = "hermes-pycharm-batch-processor-isg-4xlarge-job-definition-dr"
jd_timeout_4xlarge = 3000
jd_container_vcpu_4xlarge = "16"
jd_container_memory_4xlarge = "29696"
eb_rule_name_4xlarge = "hermes-pycharm-batch-processor-isg-4xlarge-rule-dr"
eb_rule_event_pattern_4xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dr"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/isg/3200/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_4xlarge = "Hermes-PyCharm-Batch-Processor-ISG-4XLarge-Job-DR"
// End pycharm-batch-processor-isg-4xlarge config
// Begin pycharm-batch-processor-isg-8xlarge config
ce_name_8xlarge = "hermes-pycharm-batch-processor-isg-8xlarge-compute-env-dr"
ce_cr_instance_type_8xlarge = ["c7i.8xlarge"]
ce_cr_max_vcpus_8xlarge = 32
jq_name_8xlarge = "hermes-pycharm-batch-processor-isg-8xlarge-job-queue-dr"
jd_name_8xlarge = "hermes-pycharm-batch-processor-isg-8xlarge-job-definition-dr"
jd_timeout_8xlarge = 4800
jd_container_vcpu_8xlarge = "32"
jd_container_memory_8xlarge = "59392"
eb_rule_name_8xlarge = "hermes-pycharm-batch-processor-isg-8xlarge-rule-dr"
eb_rule_event_pattern_8xlarge = {
	detail = {
		bucket = {
			name = ["pycharm-serverless-dr"]
		},
		object = {
			key = [
				{
					prefix = "hermes2/pycharm_incoming/incoming/isg/6400/"
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_8xlarge = "Hermes-PyCharm-Batch-Processor-ISG-8XLarge-Job-DR"
// End pycharm-batch-processor-isg-8xlarge config