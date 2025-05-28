resource "aws_glue_job" "my_job" {
	name = var.job_name
	role_arn = var.role_arn
	command {
		name = var.cmd_name
		python_version = var.cmd_python_version
		script_location = var.cmd_script_location
	}
	execution_property {
		max_concurrent_runs = var.max_concurrent_runs
	}
	execution_class = var.execution_class
	max_capacity = var.max_capacity
	connections = var.connections
	default_arguments = var.default_arguments
}