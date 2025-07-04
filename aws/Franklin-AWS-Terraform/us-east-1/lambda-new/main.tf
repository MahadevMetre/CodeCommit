module "lambda" {
    source = "../../modules/compute/generic_lambda"
    lambda_function_name = var.lambda_function_name
    role = var.role
    description = var.description
    env_variables = var.env_variables
    tags = var.tags
    memory_size = var.memory_size
    timeout = var.timeout
    subnets = var.subnets
    security_groups = var.security_groups
    reserved_concurrent_executions = var.reserved_concurrent_executions
    publish = var.publish
    runtime = var.runtime
    handler = var.handler
    filename = var.filename
    package_type = var.package_type
    source_code_hash = var.source_code_hash
    layers = var.layers
    ec2_start_stop_schedules = var.ec2_start_stop_schedules
    hermes_job_launcher_schedules = var.hermes_job_launcher_schedules
    schedule_group_tags = var.schedule_group_tags
	batch_job_launcher_schedules = var.batch_job_launcher_schedules
}