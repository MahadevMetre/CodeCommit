// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = true
hermes_file_processing_basic_t1_non_pgp_bool = true
hermes_file_processing_basic_t2_non_pgp_bool = true
hermes_file_processing_medium_non_pgp_bool = true
eb_rule_name_basic_non_pgp = "hermes-file-integration-ils-non-pgp-basic-rule-dr"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-ils-non-pgp-basic-t1-rule-dr"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-ils-non-pgp-basic-t2-rule-dr"
eb_rule_name_medium_non_pgp = "hermes-file-integration-ils-non-pgp-medium-rule-dr"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
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
eb_rule_event_pattern_basic_t1_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						5242880,
						"<=",
						18874368
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
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						18874368,
						"<=",
						34603008
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
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						34603008,
						"<=",
						47185920
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-ILS-Non-PGP-Basic-Job-DR"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-ILS-Non-PGP-Basic-T1-Job-DR"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-ILS-Non-PGP-Basic-T2-Job-DR"
event_target_job_name_medium_non_pgp = "Hermes-File-Integration-ILS-Non-PGP-Medium-Job-DR"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:hermes-file-integration-dr"
jd_container_exec_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_job_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
event_target_jq_arn = "arn:aws:batch:us-west-2:214946096060:job-queue/hermes-file-processing-job-queue-dr"
event_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
sqs_dlq_arn = "arn:aws:sqs:us-west-2:214946096060:hermes-serverless-dlq-dr"

// Begin file-integration-ils-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-ils-basic-job-definition-dr"
jd_timeout_basic = 900
jd_container_vcpu_basic = "2.0"
jd_container_memory_basic = "4096"
jd_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ILS-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-ils-basic-rule-dr"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						200000
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ILS-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-ILS-Basic-Job-DR"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ILS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ILS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-ils-basic config
// Begin file-integration-ils-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-ils-basic-t1-job-definition-dr"
jd_timeout_basic_t1 = 1800
jd_container_vcpu_basic_t1 = "2.0"
jd_container_memory_basic_t1 = "4096"
jd_tags_basic_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ILS-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-ils-basic-t1-rule-dr"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils/"
				}
			]
			size = [
				{
					numeric = [
						">",
						200000,
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
eb_rule_tags_basic_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ILS-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-ILS-Basic-T1-Job-DR"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ILS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ILS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-ils-basic-t1 config
// Begin file-integration-ils-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-ils-basic-t2-job-definition-dr"
jd_timeout_basic_t2 = 2400
jd_container_vcpu_basic_t2 = "2.0"
jd_container_memory_basic_t2 = "4096"
jd_tags_basic_t2 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ILS-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-ils-basic-t2-rule-dr"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils/"
				}
			]
			size = [
				{
					numeric = [
						">",
						1000000,
						"<=",
						1750000
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ILS-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-ILS-Basic-T2-Job-DR"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ILS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ILS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-ils-basic-t2 config
// Begin file-integration-ils-medium config
hermes_file_processing_medium_bool = true
jd_name_medium = "hermes-file-integration-ils-medium-job-definition-dr"
jd_timeout_medium = 3600
jd_container_vcpu_medium = "2.0"
jd_container_memory_medium = "4096"
jd_tags_medium = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ILS-jd-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium = "hermes-file-integration-ils-medium-rule-dr"
eb_rule_event_pattern_medium = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
		},
		object = {
			key = [
				{
					prefix = "incoming/ils/"
				}
			]
			size = [
				{
					numeric = [
						">",
						1750000,
						"<=",
						7000000
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ILS-ebr-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium = "Hermes-File-Integration-ILS-Medium-Job-DR"
et_transformer_input_paths_medium = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ILS_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ILS_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-ils-medium config