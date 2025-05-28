// Begin Non-PGP config here for easier copy paste
hermes_file_processing_basic_non_pgp_bool = false
hermes_file_processing_basic_t1_non_pgp_bool = false
hermes_file_processing_basic_t2_non_pgp_bool = false
hermes_file_processing_medium_non_pgp_bool = false
hermes_file_processing_medium_t1_non_pgp_bool = false
hermes_file_processing_xlarge_non_pgp_bool = false
eb_rule_name_basic_non_pgp = "hermes-file-integration-isg-non-pgp-basic-rule-stage"
eb_rule_name_basic_t1_non_pgp = "hermes-file-integration-isg-non-pgp-basic-t1-rule-stage"
eb_rule_name_basic_t2_non_pgp = "hermes-file-integration-isg-non-pgp-basic-t2-rule-stage"
eb_rule_name_medium_non_pgp = "hermes-file-integration-isg-non-pgp-medium-rule-stage"
eb_rule_name_medium_t1_non_pgp = "hermes-file-integration-isg-non-pgp-medium-t1-rule-stage"
eb_rule_name_xlarge_non_pgp = "hermes-file-integration-isg-non-pgp-xlarge-rule-stage"
eb_rule_event_pattern_basic_non_pgp = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg_non_pgp/"
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
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg_non_pgp/"
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
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg_non_pgp/"
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
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg_non_pgp/"
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
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg_non_pgp/"
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
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg_non_pgp/"
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
event_target_job_name_basic_non_pgp = "Hermes-File-Integration-ISG-Non-PGP-Basic-Job-Stage"
event_target_job_name_basic_t1_non_pgp = "Hermes-File-Integration-ISG-Non-PGP-Basic-T1-Job-Stage"
event_target_job_name_basic_t2_non_pgp = "Hermes-File-Integration-ISG-Non-PGP-Basic-T2-Job-Stage"
event_target_job_name_medium_non_pgp = "Hermes-File-Integration-ISG-Non-PGP-Medium-Job-Stage"
event_target_job_name_medium_t1_non_pgp = "Hermes-File-Integration-ISG-Non-PGP-Medium-T1-Job-Stage"
event_target_job_name_xlarge_non_pgp = "Hermes-File-Integration-ISG-Non-PGP-XLarge-Job-Stage"
// End Non-PGP config here for easier copy paste

jd_container_command = ["fileValidationAndJoblauncher", "Ref::S3bucket", "Ref::S3key"]
jd_container_image = "702230634984.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:hermes-file-integration-stage"
jd_container_exec_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
jd_container_job_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
event_target_jq_arn = "arn:aws:batch:us-east-1:702230634984:job-queue/hermes-file-processing-job-queue-stage"
event_target_role_arn = "arn:aws:iam::702230634984:role/hermes-ecs-task-execution-role-stage"
sqs_dlq_arn = "arn:aws:sqs:us-east-1:702230634984:hermes-serverless-dlq-stage"

// Begin file-integration-isg-basic config
hermes_file_processing_basic_bool = true
jd_name_basic = "hermes-file-integration-isg-basic-job-definition-stage"
jd_timeout_basic = 900
jd_container_vcpu_basic = "2.0"
jd_container_memory_basic = "4096"
jd_tags_basic = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGFulfillment-jd-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic = "hermes-file-integration-isg-basic-rule-stage"
eb_rule_event_pattern_basic = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg/"
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
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGFulfillment-ebr-basic"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic = "Hermes-File-Integration-ISG-Basic-Job-Stage"
et_transformer_input_paths_basic = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"25\"},{\"Name\":\"ISG_CORE_POOL_SIZE\",\"Value\":\"10\"},{\"Name\":\"ISG_THROTTLE_LIMIT\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isg-basic config
// Begin file-integration-isg-basic-t1 config
hermes_file_processing_basic_t1_bool = true
jd_name_basic_t1 = "hermes-file-integration-isg-basic-t1-job-definition-stage"
jd_timeout_basic_t1 = 1200
jd_container_vcpu_basic_t1 = "2.0"
jd_container_memory_basic_t1 = "4096"
jd_tags_basic_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGFulfillment-jd-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t1 = "hermes-file-integration-isg-basic-t1-rule-stage"
eb_rule_event_pattern_basic_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg/"
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
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGFulfillment-ebr-basic-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t1 = "Hermes-File-Integration-ISG-Basic-T1-Job-Stage"
et_transformer_input_paths_basic_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"25\"},{\"Name\":\"ISG_CORE_POOL_SIZE\",\"Value\":\"10\"},{\"Name\":\"ISG_THROTTLE_LIMIT\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isg-basic-t1 config
// Begin file-integration-isg-basic-t2 config
hermes_file_processing_basic_t2_bool = true
jd_name_basic_t2 = "hermes-file-integration-isg-basic-t2-job-definition-stage"
jd_timeout_basic_t2 = 1800
jd_container_vcpu_basic_t2 = "2.0"
jd_container_memory_basic_t2 = "4096"
jd_tags_basic_t2 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGFulfillment-jd-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_basic_t2 = "hermes-file-integration-isg-basic-t2-rule-stage"
eb_rule_event_pattern_basic_t2 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg/"
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
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGFulfillment-ebr-basic-t2"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_basic_t2 = "Hermes-File-Integration-ISG-Basic-T2-Job-Stage"
et_transformer_input_paths_basic_t2 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_basic_t2 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"25\"},{\"Name\":\"ISG_CORE_POOL_SIZE\",\"Value\":\"10\"},{\"Name\":\"ISG_THROTTLE_LIMIT\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isg-basic-t2 config
// Begin file-integration-isg-medium config
hermes_file_processing_medium_bool = true
jd_name_medium = "hermes-file-integration-isg-medium-job-definition-stage"
jd_timeout_medium = 2100
jd_container_vcpu_medium = "2.0"
jd_container_memory_medium = "6144"
jd_tags_medium = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGFulfillment-jd-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium = "hermes-file-integration-isg-medium-rule-stage"
eb_rule_event_pattern_medium = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg/"
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
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGFulfillment-ebr-medium"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium = "Hermes-File-Integration-ISG-Medium-Job-Stage"
et_transformer_input_paths_medium = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"25\"},{\"Name\":\"ISG_CORE_POOL_SIZE\",\"Value\":\"10\"},{\"Name\":\"ISG_THROTTLE_LIMIT\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isg-medium config
// Begin file-integration-isg-medium-t1 config
hermes_file_processing_medium_t1_bool = true
jd_name_medium_t1 = "hermes-file-integration-isg-medium-t1-job-definition-stage"
jd_timeout_medium_t1 = 2400
jd_container_vcpu_medium_t1 = "2.0"
jd_container_memory_medium_t1 = "8192"
jd_tags_medium_t1 = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGFulfillment-jd-medium-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_medium_t1 = "hermes-file-integration-isg-medium-t1-rule-stage"
eb_rule_event_pattern_medium_t1 = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg/"
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
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGFulfillment-ebr-medium-t1"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_medium_t1 = "Hermes-File-Integration-ISG-Medium-T1-Job-Stage"
et_transformer_input_paths_medium_t1 = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_medium_t1 = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"25\"},{\"Name\":\"ISG_CORE_POOL_SIZE\",\"Value\":\"10\"},{\"Name\":\"ISG_THROTTLE_LIMIT\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isg-medium-t1 config
// Begin file-integration-isg-xlarge config
hermes_file_processing_xlarge_bool = true
jd_name_xlarge = "hermes-file-integration-isg-xlarge-job-definition-stage"
jd_timeout_xlarge = 3600
jd_container_vcpu_xlarge = "2.0"
jd_container_memory_xlarge = "10240"
jd_tags_xlarge = {
	"ApplicationName"				= "Hermes2.0"
	"Automated"						= "True"
	"BackupPlan"					= "None"
	"CostCenter"					= "Operations"
	"CreatedBy"						= "DevOps"
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingJobDefinition"	= "ISGFulfillment-jd-xlarge"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}

eb_rule_name_xlarge = "hermes-file-integration-isg-xlarge-rule-stage"
eb_rule_event_pattern_xlarge = {
	detail = {
		bucket = {
			name = ["hermes-file-integration-stage"]
		},
		object = {
			key = [
				{
					prefix = "incoming/isg/"
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
	"CreatedOn"						= "08142023"
	"DataClassification"			= "None"
	"Department"					= "HMS2"
	"FileProcessingEventBridgeRule"	= "ISGFulfillment-ebr-xlarge"
	"Infrastructure"				= "False"
	"LastUpdated"					= "09082023"
	"TechStack"						= "AWS"
	"Usage"							= "Project"
	"Version"						= "1.0"
}
event_target_job_name_xlarge = "Hermes-File-Integration-ISG-XLarge-Job-Stage"
et_transformer_input_paths_xlarge = {
	"S3BucketValue" = "$.detail.bucket.name",
	"S3KeyValue" = "$.detail.object.key"
}
et_transformer_input_template_xlarge = "{\"Parameters\":{\"S3bucket\":\"<S3BucketValue>\",\"S3key\":\"<S3KeyValue>\"},\"ContainerOverrides\":{\"Environment\":[{\"Name\":\"DB_CONNECTION_POOL\",\"Value\":\"25\"},{\"Name\":\"ISG_CORE_POOL_SIZE\",\"Value\":\"10\"},{\"Name\":\"ISG_THROTTLE_LIMIT\",\"Value\":\"10\"},{\"Name\":\"LOG_LEVEL\",\"Value\":\"DEBUG\"}]}}"
// End file-integration-isg-xlarge config