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
    package_type = "Image"
    image_uri = var.image_uri
    layers = var.layers
    snap_start {
        apply_on = var.snap_start_apply_on
    }
	# The following block is added to ignore the source code update in case we need to change only the other attr of lambda, like env var, vpc etc.
	# Comment out in case we need to update the source code via terraform
	lifecycle {
		ignore_changes = [snap_start]
	}
}

resource "aws_lambda_function_event_invoke_config" "my_lambda_config" {
  count = var.event_invoke_config ? 1 :0
  function_name                = aws_lambda_function.lambda.function_name
  maximum_event_age_in_seconds = 21600
  maximum_retry_attempts       = 0
}

resource "aws_lambda_permission" "apigw_permission" {
  count = var.attach_apigw_permission ? length(var.apigw_arn) : 0
  statement_id  = "apigw-permission-${count.index}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = var.attach_apigw_permission ? var.apigw_arn[count.index] : null
}