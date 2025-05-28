resource "aws_batch_compute_environment" "hms_file_processing_ce" {
	count = var.hermes_file_processing_bool ? 1: 0
	compute_environment_name = var.ce_name

	compute_resources {
		max_vcpus = var.ce_cr_max_vcpus
		security_group_ids = var.ce_cr_sg_list
		subnets = var.ce_cr_subnet_list
		type = var.ce_cr_type
	}

	service_role	= var.ce_service_role
	type			= var.ce_type
	tags			= var.ce_tags
}

resource "aws_batch_job_queue" "hms_file_processing_jq" {
	count = var.hermes_file_processing_bool ? 1: 0
	name					= var.jq_name
	state					= "ENABLED"
	priority				= 1
	compute_environments	= [aws_batch_compute_environment.hms_file_processing_ce[0].arn]
}