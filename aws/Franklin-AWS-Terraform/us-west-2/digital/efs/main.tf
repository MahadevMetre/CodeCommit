module "efs_file_system" {
	source = "../../../modules/storage/efs/"
	efs_name = var.efs_name
	efs_perf_mode = var.efs_perf_mode
	efs_throughput_mode = var.efs_throughput_mode
	efs_encrypted = var.efs_encrypted
	efs_tags = var.efs_tags
	kms_key_id = var.kms_key_id
	efs_security_group_name = var.efs_security_group_name
	vpc_id = var.vpc_id
	subnet_id = var.subnet_id
	efs_attach_to_second_subnet = var.efs_attach_to_second_subnet
	subnet2_id = var.subnet2_id
}