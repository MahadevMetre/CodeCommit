// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = true
hermes_file_processing_basic_t1_non_pgp_bool = true
hermes_file_processing_basic_t2_non_pgp_bool = true
eb_rule_name_basic_non_pgp = "hermes-file-integration-coa-non-pgp-basic-rule-qa"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-coa-non-pgp-basic-t1-rule-qa"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-coa-non-pgp-basic-t2-rule-qa"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/mailtracking/coa_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						1000000
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
					prefix = "incoming/mailtracking/coa_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						1000000,
						"<=",
						3000000
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
					prefix = "incoming/mailtracking/coa_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						3000000,
						"<=",
						12000000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-COA-Non-PGP-Basic-Job-QA"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-COA-Non-PGP-Basic-T1-Job-QA"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-COA-Non-PGP-Basic-T2-Job-QA"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-file-integration-qa"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
event_target_jq_arn = "arn:aws:batch:us-east-1:702230634984:job-queue/hermes-file-processing-job-queue-qa"
event_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-qa"

// Begin file-integration-coa-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-coa-basic-job-definition-qa"
jd_timeout_basic = 900
jd_container_vcpu_basic = "2.0"
jd_container_memory_basic = "4096"
jd_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "09012023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "COA-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-coa-basic-rule-qa"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/mailtracking/coa/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						1000000
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
	"CreatedOn"						= "09012023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "COA-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-COA-Basic-Job-QA"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"COA_CHUNK_SIZE\",\"Value\":\"50\"},{\"Name\":\"COA_CORE_POOL_SIZE\",\"Value\":\"1\"},{\"Name\":\"COA_THROTTLE_LIMIT\",\"Value\":\"1\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-coa-basic config
// Begin file-integration-coa-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-coa-basic-t1-job-definition-qa"
jd_timeout_basic_t1 = 1200
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
	"FileProcessingJobDefinition"	= "COA-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-coa-basic-t1-rule-qa"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/mailtracking/coa/"
				}
			]
			size = [
				{
					numeric = [
						">",
						1000000,
						"<=",
						3000000
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
	"FileProcessingEventBridgeRule"	= "COA-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-COA-Basic-T1-Job-QA"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"COA_CHUNK_SIZE\",\"Value\":\"50\"},{\"Name\":\"COA_CORE_POOL_SIZE\",\"Value\":\"1\"},{\"Name\":\"COA_THROTTLE_LIMIT\",\"Value\":\"1\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-coa-basic-t1 config
// Begin file-integration-coa-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-coa-basic-t2-job-definition-qa"
jd_timeout_basic_t2 = 2400
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
	"FileProcessingJobDefinition"	= "COA-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-coa-basic-t2-rule-qa"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/mailtracking/coa/"
				}
			]
			size = [
				{
					numeric = [
						">",
						3000000,
						"<=",
						12000000
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
	"FileProcessingEventBridgeRule"	= "COA-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-COA-Basic-T2-Job-QA"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"COA_CHUNK_SIZE\",\"Value\":\"50\"},{\"Name\":\"COA_CORE_POOL_SIZE\",\"Value\":\"1\"},{\"Name\":\"COA_THROTTLE_LIMIT\",\"Value\":\"1\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-coa-basic-t2 config