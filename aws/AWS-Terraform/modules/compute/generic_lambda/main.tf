resource "aws_lambda_function" "lambda" {
    function_name = var.lambda_function_name
    role = var.role
    description = var.description
    environment {
        variables = var.env_variables
    }
    tags = var.tags
    memory_size = var.memory_size
    timeout = var.timeout
    vpc_config {
        subnet_ids = var.subnets
        security_group_ids = var.security_groups
    }
	ephemeral_storage {
		size = var.ephemeral_storage_size
	}
    reserved_concurrent_executions = var.reserved_concurrent_executions
    publish = var.publish
    runtime = var.runtime
    handler = var.handler
    filename = var.filename
    package_type = var.package_type
    source_code_hash = base64sha256(var.source_code_hash)
    layers = var.layers
    snap_start {
        apply_on = var.snap_start_apply_on
    }
	# The following block is added to ignore the source code update in case we need to change only the other attr of lambda, like env var, vpc etc.
	# Comment out in case we need to update the source code via terraform
	lifecycle {
		ignore_changes = [source_code_hash, snap_start]
	}
}

resource "aws_lambda_function_event_invoke_config" "my_lambda_config" {
  count = var.event_invoke_config ? 1 :0
  function_name                = aws_lambda_function.lambda.function_name
  maximum_event_age_in_seconds = 21600
  maximum_retry_attempts       = 0
}

resource "aws_lambda_permission" "apigw_permission" {
  count = var.attach_apigw_permission ? 1 : 0
  statement_id  = "apigw-permission"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.apigw_arn
}

resource "aws_lambda_permission" "sns_permission" {
  count = var.attach_sns_permission ? 1 : 0
  statement_id  = "lambda-sns-trigger"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = "arn:aws:sns:us-east-1:806199016981:AmazonIpSpaceChanged"
}

resource "aws_lambda_permission" "s3_permission" {
  count				= var.attach_s3_permission ? 1 : 0
  statement_id		= var.s3_bucket_statement_id
  action			= "lambda:InvokeFunction"
  function_name		= aws_lambda_function.lambda.function_name
  principal			= "s3.amazonaws.com"
  source_account	= var.s3_bucket_account_id
  source_arn		= var.s3_bucket_arn
}