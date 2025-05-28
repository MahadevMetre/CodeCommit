// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = false
hermes_file_processing_basic_t1_non_pgp_bool = false
hermes_file_processing_basic_t2_non_pgp_bool = false
hermes_file_processing_medium_non_pgp_bool = false
eb_rule_name_basic_non_pgp = "hermes-file-integration-insapchecks-non-pgp-basic-rule-qa"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-insapchecks-non-pgp-basic-t1-rule-qa"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-insapchecks-non-pgp-basic-t2-rule-qa"
eb_rule_name_medium_non_pgp = "hermes-file-integration-insapchecks-non-pgp-medium-rule-qa"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						1048576
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
					prefix = "incoming/insapchecks_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						1048576,
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
eb_rule_event_pattern_basic_t2_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						3145728,
						"<=",
						5242880
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_event_pattern_medium_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						5242880,
						"<=",
						26214400
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-INSAPCHECKS-Non-PGP-Basic-Job-QA"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-INSAPCHECKS-Non-PGP-Basic-T1-Job-QA"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-INSAPCHECKS-Non-PGP-Basic-T2-Job-QA"
event_target_job_name_medium_non_pgp = "Hermes-File-Integration-INSAPCHECKS-Non-PGP-Medium-Job-QA"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "634621569833.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-file-integration-qa"
jd_container_exec_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
event_target_jq_arn = "arn:aws:batch:us-east-1:634621569833:job-queue/hermes-file-processing-job-queue-qa"
event_target_role_arn = "arn:aws:iam::634621569833:role/hermes-ecs-task-execution-role-qa"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:634621569833:hermes-serverless-dlq-qa"

// Begin file-integration-insapchecks-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-insapchecks-basic-job-definition-qa"
jd_timeout_basic = 420
jd_container_vcpu_basic = "2.0"
jd_container_memory_basic = "4096"
jd_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "INSAPCHECKS-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-insapchecks-basic-rule-qa"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						100000
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
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "INSAPCHECKS-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-INSAPCHECKS-Basic-Job-QA"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"INSAPCHECKS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"INSAPCHECKS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-insapchecks-basic config
// Begin file-integration-insapchecks-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-insapchecks-basic-t1-job-definition-qa"
jd_timeout_basic_t1 = 900
jd_container_vcpu_basic_t1 = "2.0"
jd_container_memory_basic_t1 = "4096"
jd_tags_basic_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "INSAPCHECKS-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-insapchecks-basic-t1-rule-qa"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks/"
				}
			]
			size = [
				{
					numeric = [
						">",
						100000,
						"<=",
						350000
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
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "INSAPCHECKS-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-INSAPCHECKS-Basic-T1-Job-QA"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"INSAPCHECKS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"INSAPCHECKS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-insapchecks-basic-t1 config
// Begin file-integration-insapchecks-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-insapchecks-basic-t2-job-definition-qa"
jd_timeout_basic_t2 = 1200
jd_container_vcpu_basic_t2 = "2.0"
jd_container_memory_basic_t2 = "4096"
jd_tags_basic_t2 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "INSAPCHECKS-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-insapchecks-basic-t2-rule-qa"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks/"
				}
			]
			size = [
				{
					numeric = [
						">",
						350000,
						"<=",
						600000
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
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "INSAPCHECKS-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-INSAPCHECKS-Basic-T2-Job-QA"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"INSAPCHECKS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"INSAPCHECKS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-insapchecks-basic-t2 config
// Begin file-integration-insapchecks-medium config
hermes_file_processing_medium_bool = true
jd_name_medium = "hermes-file-integration-insapchecks-medium-job-definition-qa"
jd_timeout_medium = 1800
jd_container_vcpu_medium = "2.0"
jd_container_memory_medium = "4096"
jd_tags_medium = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "INSAPCHECKS-jd-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium = "hermes-file-integration-insapchecks-medium-rule-qa"
eb_rule_event_pattern_medium = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/insapchecks/"
				}
			]
			size = [
				{
					numeric = [
						">",
						600000,
						"<=",
						2400000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_tags_medium = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "05202024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "INSAPCHECKS-ebr-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "05202024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium = "Hermes-File-Integration-INSAPCHECKS-Medium-Job-QA"
et_transformer_input_paths_medium = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"INSAPCHECKS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"INSAPCHECKS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-insapchecks-medium config