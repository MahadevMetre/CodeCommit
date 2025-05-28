module "glue_job" {
	source = "../../../modules/glue/job/"
	job_name = var.job_name
	role_arn = var.role_arn
	cmd_name = var.cmd_name
	cmd_python_version = var.cmd_python_version
	cmd_script_location = var.cmd_script_location
	max_concurrent_runs = var.max_concurrent_runs
	execution_class = var.execution_class
	max_capacity = var.max_capacity
	connections = var.connections
	default_arguments = var.default_arguments
}