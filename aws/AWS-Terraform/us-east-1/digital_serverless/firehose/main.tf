resource "aws_cloudwatch_log_group" "log-group" {
	name				= var.log_group_name
	retention_in_days	= var.log_retention_days
	tags				= var.config_set_tags
}

resource "aws_cloudwatch_log_stream" "DestinationDelivery" {
	name				= "DestinationDelivery"
	log_group_name		= aws_cloudwatch_log_group.log-group.name
}

resource "aws_cloudwatch_log_stream" "BackupDelivery" {
	name				= "BackupDelivery"
	log_group_name		= aws_cloudwatch_log_group.log-group.name
}

module "s3_bucket" {
	source						= "../../../modules/storage/s3/s3-bucket/"
	s3_bucketName				= var.bucket_short_name
	environment					= var.environment
	tags						= var.s3b_tags
	acl							= var.acl
	s3_logging_bucketName		= var.logging_bucket_name
	logging_bucket_base_prefix	= var.logging_bucket_base_prefix
}

module "iam_policy" {
	source								= "../../../modules/iam/user_policy/"
	iam_policy_name						= var.iam_policy_name
	iam_policy_desc						= var.iam_policy_desc
	s3_bucket_arn						= module.s3_bucket.s3_bucket_arn
	iam_policy_tags						= var.iam_policy_tags
	digital_email_tracking_policy		= var.digital_email_tracking_policy
	fs_stream_name						= var.fs_stream_name
	lambda_arn							= module.lambda.lambda_out.arn
}

module "role" {
	source								= "../../../modules/iam/roles/"
	role_name							= var.role_name
	role_tags							= var.role_tags
	iam_role_desc						= var.iam_role_desc
	digital_email_tracking_policy		= var.digital_email_tracking_policy
	digital_email_tracking_policy_arn	= module.iam_policy.digital_email_tracking_policy_out.arn
}

module "lambda" {
    source = "../../../modules/compute/generic_lambda"
    lambda_function_name = var.lambda_function_name
    role = var.lambda_role
    description = var.lambda_description
    env_variables = var.lambda_env_variables
    tags = var.lambda_tags
    memory_size = var.lambda_memory_size
    timeout = var.lambda_timeout
    runtime = var.lambda_runtime
    handler = var.lambda_handler
    filename = var.lambda_filename
    package_type = var.lambda_package_type
    source_code_hash = var.lambda_source_code_hash
}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_dest" {
	name		= var.fs_stream_name
	destination	= "extended_s3"

	extended_s3_configuration {
		role_arn			= module.role.admin_iam_role_arn
		bucket_arn			= module.s3_bucket.s3_bucket_arn
		custom_time_zone	= var.ext_s3_config_custom_time_zone
		file_extension		= var.ext_s3_config_file_extension
		s3_backup_mode		= var.ext_s3_config_s3_backup_mode
		buffering_size		= var.ext_s3_config_buffering_size
		buffering_interval	= var.ext_s3_config_buffering_interval

		cloudwatch_logging_options {
			enabled			= "true"
			log_group_name	= var.log_group_name
			log_stream_name	= "DestinationDelivery"
		}

		s3_backup_configuration {
			role_arn			= module.role.admin_iam_role_arn
			bucket_arn			= module.s3_bucket.s3_bucket_arn
			prefix				= var.s3_backup_config_prefix
			error_output_prefix	= var.s3_backup_config_error_output_prefix

			cloudwatch_logging_options {
				enabled			= "true"
				log_group_name	= var.log_group_name
				log_stream_name	= "BackupDelivery"
			}
		}

		processing_configuration {
			enabled = "true"

			processors {
				type = "Lambda"

				parameters {
					parameter_name  = "LambdaArn"
					parameter_value = "${module.lambda.lambda_out.arn}:$LATEST"
				}
				parameters {
					parameter_name  = "BufferSizeInMBs"
					parameter_value = var.lambda_processor_buffer_size
				}
				parameters {
					parameter_name  = "BufferIntervalInSeconds"
					parameter_value = var.lambda_processor_buffer_interval
				}
			}
		}
	}

	tags = var.fs_tags
}

resource "aws_sesv2_configuration_set" "ses_config_set" {
	configuration_set_name			= var.config_set_name
	delivery_options {
		tls_policy					= "REQUIRE"
	}
	reputation_options {
		reputation_metrics_enabled	= false
	}
	tags = var.config_set_tags
}

resource "aws_sesv2_configuration_set_event_destination" "ses_event_destination" {
	event_destination_name		= var.event_dest_name
	configuration_set_name		= aws_sesv2_configuration_set.ses_config_set.configuration_set_name
	event_destination {
		kinesis_firehose_destination {
			delivery_stream_arn	= aws_kinesis_firehose_delivery_stream.extended_s3_dest.arn
			iam_role_arn		= module.role.admin_iam_role_arn
		}
		enabled					= true
		matching_event_types	= var.event_types
	}
}