// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = false
hermes_file_processing_basic_t1_non_pgp_bool = false
hermes_file_processing_basic_t2_non_pgp_bool = false
hermes_file_processing_medium_non_pgp_bool = false
hermes_file_processing_medium_t1_non_pgp_bool = false
hermes_file_processing_xlarge_non_pgp_bool = false
eb_rule_name_basic_non_pgp = "hermes-file-integration-isgconv-non-pgp-basic-rule-dr"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-isgconv-non-pgp-basic-t1-rule-dr"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-isgconv-non-pgp-basic-t2-rule-dr"
eb_rule_name_medium_non_pgp = "hermes-file-integration-isgconv-non-pgp-medium-rule-dr"
eb_rule_name_medium_t1_non_pgp = "hermes-file-integration-isgconv-non-pgp-medium-t1-rule-dr"
eb_rule_name_xlarge_non_pgp = "hermes-file-integration-isgconv-non-pgp-xlarge-rule-dr"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
			name = ["hermes-file-integration-dr"]
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
			name = ["hermes-file-integration-dr"]
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
			name = ["hermes-file-integration-dr"]
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
			name = ["hermes-file-integration-dr"]
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
			name = ["hermes-file-integration-dr"]
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
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Basic-Job-DR"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Basic-T1-Job-DR"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Basic-T2-Job-DR"
event_target_job_name_medium_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Medium-Job-DR"
event_target_job_name_medium_t1_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-Medium-T1-Job-DR"
event_target_job_name_xlarge_non_pgp = "Hermes-File-Integration-ISGCONV-Non-PGP-XLarge-Job-DR"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "214946096060.dkr.ecr.us-west-2.amazonaws.com/fmg-insuranceapps:hermes-file-integration-dr"
jd_container_exec_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
jd_container_job_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
event_target_jq_arn = "arn:aws:batch:us-west-2:214946096060:job-queue/hermes-file-processing-job-queue-dr"
event_target_role_arn = "arn:aws:iam::214946096060:role/hermes-ecs-task-execution-role-dr"
sqs_dlq_arn = "arn:aws:sqs:us-west-2:214946096060:hermes-serverless-dlq-dr"

// Begin file-integration-isgconv-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-isgconv-basic-job-definition-dr"
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
	"FileProcessingJobDefinition"	= "ISGCONV-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-isgconv-basic-rule-dr"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-ISGCONV-Basic-Job-DR"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-basic config
// Begin file-integration-isgconv-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-isgconv-basic-t1-job-definition-dr"
jd_timeout_basic_t1 = 1200
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
	"FileProcessingJobDefinition"	= "ISGCONV-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-isgconv-basic-t1-rule-dr"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-ISGCONV-Basic-T1-Job-DR"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-basic-t1 config
// Begin file-integration-isgconv-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-isgconv-basic-t2-job-definition-dr"
jd_timeout_basic_t2 = 1800
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
	"FileProcessingJobDefinition"	= "ISGCONV-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-isgconv-basic-t2-rule-dr"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-ISGCONV-Basic-T2-Job-DR"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-basic-t2 config
// Begin file-integration-isgconv-medium config
hermes_file_processing_medium_bool = true
jd_name_medium = "hermes-file-integration-isgconv-medium-job-definition-dr"
jd_timeout_medium = 2100
jd_container_vcpu_medium = "2.0"
jd_container_memory_medium = "6144"
jd_tags_medium = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium = "hermes-file-integration-isgconv-medium-rule-dr"
eb_rule_event_pattern_medium = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium = "Hermes-File-Integration-ISGCONV-Medium-Job-DR"
et_transformer_input_paths_medium = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-medium config
// Begin file-integration-isgconv-medium-t1 config
hermes_file_processing_medium_t1_bool = true
jd_name_medium_t1 = "hermes-file-integration-isgconv-medium-t1-job-definition-dr"
jd_timeout_medium_t1 = 2400
jd_container_vcpu_medium_t1 = "2.0"
jd_container_memory_medium_t1 = "8192"
jd_tags_medium_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-medium-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium_t1 = "hermes-file-integration-isgconv-medium-t1-rule-dr"
eb_rule_event_pattern_medium_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-medium-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium_t1 = "Hermes-File-Integration-ISGCONV-Medium-T1-Job-DR"
et_transformer_input_paths_medium_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-medium-t1 config
// Begin file-integration-isgconv-xlarge config
hermes_file_processing_xlarge_bool = true
jd_name_xlarge = "hermes-file-integration-isgconv-xlarge-job-definition-dr"
jd_timeout_xlarge = 3600
jd_container_vcpu_xlarge = "2.0"
jd_container_memory_xlarge = "10240"
jd_tags_xlarge = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGCONV-jd-xlarge"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_xlarge = "hermes-file-integration-isgconv-xlarge-rule-dr"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-dr"]
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
	"CreatedOn"						= "02232024"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGCONV-ebr-xlarge"
	"Infrastructure"				= "False"
	"LastUpdated"					= "02232024"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_xlarge = "Hermes-File-Integration-ISGCONV-XLarge-Job-DR"
et_transformer_input_paths_xlarge = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_xlarge = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"20\"},{\"Name\":\"ISGCONV_CHUNK_SIZE\",\"Value\":\"1\"},{\"Name\":\"ISGCONV_CORE_POOL_SIZE\",\"Value\":\"8\"},{\"Name\":\"ISGCONV_THROTTLE_LIMIT\",\"Value\":\"8\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isgconv-xlarge config