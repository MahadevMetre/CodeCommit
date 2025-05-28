// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = false
hermes_file_processing_basic_t1_non_pgp_bool = false
hermes_file_processing_basic_t2_non_pgp_bool = false
hermes_file_processing_medium_non_pgp_bool = false
hermes_file_processing_medium_t1_non_pgp_bool = false
hermes_file_processing_xlarge_non_pgp_bool = false
eb_rule_name_basic_non_pgp = "hermes-file-integration-isgconv-non-pgp-basic-rule-qa"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-isgconv-non-pgp-basic-t1-rule-qa"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-isgconv-non-pgp-basic-t2-rule-qa"
eb_rule_name_medium_non_pgp = "hermes-file-integration-isgconv-non-pgp-medium-rule-qa"
eb_rule_name_medium_t1_non_pgp = "hermes-file-integration-isgconv-non-pgp-medium-t1-rule-qa"
eb_rule_name_xlarge_non_pgp = "hermes-file-integration-isgconv-non-pgp-xlarge-rule-qa"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						52428800
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
					prefix = "incoming/isgconv_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						52428800,
						"<=",
						131072000
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
					prefix = "incoming/isgconv_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						131072000,
						"<=",
						183500800
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
					prefix = "incoming/isgconv_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						183500800,
						"<=",
						235929600
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_event_pattern_medium_t1_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						235929600,
						"<=",
						314572800
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_event_pattern_xlarge_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv_non_pgp/"
				}
			]
			size = [
				{
					numeric = [
						">",
						314572800,
						"<=",
						445644800
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Basic-Job-QA"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Basic-T1-Job-QA"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Basic-T2-Job-QA"
event_target_job_name_medium_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Medium-Job-QA"
event_target_job_name_medium_t1_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Medium-T1-Job-QA"
event_target_job_name_xlarge_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-XLarge-Job-QA"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-file-integration-qa"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
event_target_jq_arn = "arn:aws:batch:us-east-1:702230634984:job-queue/hermes-file-processing-job-queue-qa"
event_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-qa"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-qa"

// Begin file-integration-isgconv-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-isgconv-basic-job-definition-qa"
jd_timeout_basic = 900
jd_container_vcpu_basic = "2.0"
jd_container_memory_basic = "4096"
jd_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "10182023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "10182023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-isgconv-basic-rule-qa"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv/"
				}
			]
			size = [
				{
					numeric = [
						">",
						0,
						"<=",
						1250000
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
	"CreatedOn"						= "10182023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "10182023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-ISGCONV-Basic-Job-QA"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-basic config
// Begin file-integration-isgconv-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-isgconv-basic-t1-job-definition-qa"
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
	"FileProcessingJobDefinition"	= "ISGCONV-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-isgconv-basic-t1-rule-qa"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv/"
				}
			]
			size = [
				{
					numeric = [
						">",
						1250000,
						"<=",
						3500000
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
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-ISGCONV-Basic-T1-Job-QA"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-basic-t1 config
// Begin file-integration-isgconv-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-isgconv-basic-t2-job-definition-qa"
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
	"FileProcessingJobDefinition"	= "ISGCONV-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-isgconv-basic-t2-rule-qa"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv/"
				}
			]
			size = [
				{
					numeric = [
						">",
						3500000,
						"<=",
						5000000
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
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-ISGCONV-Basic-T2-Job-QA"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-basic-t2 config
// Begin file-integration-isgconv-medium config
hermes_file_processing_medium_bool = true
jd_name_medium = "hermes-file-integration-isgconv-medium-job-definition-qa"
jd_timeout_medium = 2100
jd_container_vcpu_medium = "2.0"
jd_container_memory_medium = "6144"
jd_tags_medium = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium = "hermes-file-integration-isgconv-medium-rule-qa"
eb_rule_event_pattern_medium = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv/"
				}
			]
			size = [
				{
					numeric = [
						">",
						5000000,
						"<=",
						6500000
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
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium = "Hermes-File-Integration-ISGCONV-Medium-Job-QA"
et_transformer_input_paths_medium = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-medium config
// Begin file-integration-isgconv-medium-t1 config
hermes_file_processing_medium_t1_bool = true
jd_name_medium_t1 = "hermes-file-integration-isgconv-medium-t1-job-definition-qa"
jd_timeout_medium_t1 = 2400
jd_container_vcpu_medium_t1 = "2.0"
jd_container_memory_medium_t1 = "8192"
jd_tags_medium_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-medium-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium_t1 = "hermes-file-integration-isgconv-medium-t1-rule-qa"
eb_rule_event_pattern_medium_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv/"
				}
			]
			size = [
				{
					numeric = [
						">",
						6500000,
						"<=",
						9500000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_tags_medium_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-medium-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium_t1 = "Hermes-File-Integration-ISGCONV-Medium-T1-Job-QA"
et_transformer_input_paths_medium_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-medium-t1 config
// Begin file-integration-isgconv-xlarge config
hermes_file_processing_xlarge_bool = true
jd_name_xlarge = "hermes-file-integration-isgconv-xlarge-job-definition-qa"
jd_timeout_xlarge = 3600
jd_container_vcpu_xlarge = "2.0"
jd_container_memory_xlarge = "10240"
jd_tags_xlarge = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-xlarge"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_xlarge = "hermes-file-integration-isgconv-xlarge-rule-qa"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-qa"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isgconv/"
				}
			]
			size = [
				{
					numeric = [
						">",
						9500000,
						"<=",
						38000000
					]
				}
			]
		}
	}
	detail-type = ["Object Created"]
	source = ["aws.s3"]
}
eb_rule_tags_xlarge = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "11102023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-xlarge"
	"Infrastructure"				= "False"
	"LastUpdated"					= "11102023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_xlarge = "Hermes-File-Integration-ISGCONV-XLarge-Job-QA"
et_transformer_input_paths_xlarge = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_xlarge = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-xlarge config