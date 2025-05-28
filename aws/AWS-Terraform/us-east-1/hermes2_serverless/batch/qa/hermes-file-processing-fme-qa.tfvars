// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = false
hermes_file_processing_basic_t1_non_pgp_bool = false
hermes_file_processing_basic_t2_non_pgp_bool = false
eb_rule_name_basic_non_pgp = "hermes-file-integration-fme-non-pgp-basic-rule-qa"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-fme-non-pgp-basic-t1-rule-qa"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-fme-non-pgp-basic-t2-rule-qa"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/fme_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						3145728
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_event_pattern_basic_t1_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/fme_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						3145728,
						"<=",
						10485760
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_event_pattern_basic_t2_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/fme_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						10485760,
						"<=",
						15728640
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-FME-Non-PGP-Basic-Job-QA"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-FME-Non-PGP-Basic-T1-Job-QA"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-FME-Non-PGP-Basic-T2-Job-QA"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-file-integration-qa"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
event_target_jq_arn = "arn:aws:batch:us-east-1:702230634984:job-queue/hermes-file-processing-job-queue-qa"
event_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-qa"

// Begin file-integration-fme-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-fme-basic-job-definition-qa"
jd_timeout_basic = 420
jd_container_vcpu_basic = "2.0"
jd_container_memory_basic = "4096"
jd_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08222023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "FME-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-fme-basic-rule-qa"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/fme/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						150000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08222023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "FME-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-FME-Basic-Job-QA"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"FME_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"FME_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-fme-basic config
// Begin file-integration-fme-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-fme-basic-t1-job-definition-qa"
jd_timeout_basic_t1 = 900
jd_container_vcpu_basic_t1 = "2.0"
jd_container_memory_basic_t1 = "4096"
jd_tags_basic_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "FME-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-fme-basic-t1-rule-qa"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/fme/"
				}
			]
			size = [
				{
					numeric = [
						">",
						150000,
						"<=",
						450000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_tags_basic_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "FME-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-FME-Basic-T1-Job-QA"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"FME_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"FME_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-fme-basic-t1 config
// Begin file-integration-fme-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-fme-basic-t2-job-definition-qa"
jd_timeout_basic_t2 = 1800
jd_container_vcpu_basic_t2 = "2.0"
jd_container_memory_basic_t2 = "4096"
jd_tags_basic_t2 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "FME-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-fme-basic-t2-rule-qa"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/fme/"
				}
			]
			size = [
				{
					numeric = [
						">",
						450000,
						"<=",
						1800000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_tags_basic_t2 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "FME-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-FME-Basic-T2-Job-QA"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"FME_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"FME_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-fme-basic-t2 config