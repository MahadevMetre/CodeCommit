variable "digital_serverless_bool" {
	type = bool
	default = false
}

variable "digital_customer_profile" {
	type = bool
	default = false
}

variable "digital_account_update" {
	type = bool
	default = false
}

variable "marketing_regenerate_poe" {
	type = bool
	default = false
}

variable "marketing_mb_enroll_fail" {
	type = bool
	default = false
}

variable "marketing_mb_enroll" {
	type = bool
	default = false
}

variable "marketing_discard" {
	type = bool
	default = false
}


variable "digital_schedule_env" {
  type    = string
  default = "noenv"
}

variable "ce_name" {
	default = ""
}

variable "ce_cr_allocation_strategy" {
	default = ""
}

variable "ce_cr_ec2_key_pair" {
	default = ""
}

variable "ce_cr_instance_role" {
	default = ""
}

variable "ce_cr_instance_type" {
	type = list(string)
	default = []
}

variable "ce_cr_max_vcpus" {
	default = ""
}

variable "ce_cr_sg_list" {
	type = list(string)
	default = []
}

variable "ce_cr_subnet_list" {
	type = list(string)
	default = []
}

variable "ce_cr_type" {
	default = ""
}

variable "ce_cr_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "ce_service_role" {
	default = ""
}

variable "ce_type" {
	default = ""
}

variable "ce_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "jq_name" {
	default = ""
}

variable "jd_name" {
	default = ""
}

variable "jd_timeout" {
	default = 60
}

variable "jd_container_command" {
	type = list(string)
	default = []
}

variable "jd_container_image" {
	default = ""
}

variable "jd_container_exec_role_arn" {
	default = ""
}

variable "jd_container_job_role_arn" {
	default = ""
}

variable "jd_container_vcpu" {
	default = ""
}

variable "jd_container_memory" {
	default = ""
}

variable "jd_container_env_vars" {
	type = list(map(string))
	default = []
}

variable "jd_container_volume_name" {
	default = ""
}

variable "jd_container_volume_fs_id" {
	default = ""
}

variable "jd_container_volume_root_dir" {
	default = ""
}

variable "jd_container_mountpoint_container_path" {
	default = ""
}

variable "jd_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "create_schedule_group" {
	type = bool
	default = false
}

variable "schedule_group_name" {
	default = ""
}

variable "schedule_group_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "schedule_name" {
	default = ""
}

variable "schedule_target_role_arn" {
	default = ""
}

variable "schedule_job_name" {
	default = ""
}

variable "eb_rule_name" {
	default = ""
}

variable "eb_rule_event_pattern" {
	default = {}
}

variable "eb_rule_tags" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_jq_arn" {
	default = ""
}

variable "event_target_role_arn" {
	default = ""
}

variable "sqs_dlq_arn" {
	default = ""
}

variable "event_target_job_name" {
	default = ""
}

variable "et_transformer_input_paths" {
	type = map
	default = {}
}

variable "et_transformer_input_template" {
	default = ""
}

// Begin file-processing-basic variables
variable "hermes_file_processing_basic_bool" {
	type = bool
	default = false
}

variable "hermes_file_processing_basic_non_pgp_bool" {
	type = bool
	default = false
}

variable "jd_name_basic" {
	default = ""
}

variable "jd_timeout_basic" {
	default = 60
}

variable "jd_container_vcpu_basic" {
	default = ""
}

variable "jd_container_memory_basic" {
	default = ""
}

variable "jd_tags_basic" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name_basic" {
	default = ""
}

variable "eb_rule_event_pattern_basic" {
	default = {}
}

variable "eb_rule_tags_basic" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_job_name_basic" {
	default = ""
}

variable "et_transformer_input_paths_basic" {
	default = ""
}

variable "et_transformer_input_template_basic" {
	default = ""
}
// End file-processing-basic variables
// Begin file-processing-basic-t1 variables
variable "hermes_file_processing_basic_t1_bool" {
	type = bool
	default = false
}

variable "hermes_file_processing_basic_t1_non_pgp_bool" {
	type = bool
	default = false
}

variable "jd_name_basic_t1" {
	default = ""
}

variable "jd_timeout_basic_t1" {
	default = 60
}

variable "jd_container_vcpu_basic_t1" {
	default = ""
}

variable "jd_container_memory_basic_t1" {
	default = ""
}

variable "jd_tags_basic_t1" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name_basic_t1" {
	default = ""
}

variable "eb_rule_event_pattern_basic_t1" {
	default = {}
}

variable "eb_rule_tags_basic_t1" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_job_name_basic_t1" {
	default = ""
}

variable "et_transformer_input_paths_basic_t1" {
	default = ""
}

variable "et_transformer_input_template_basic_t1" {
	default = ""
}
// End file-processing-basic-t1 variables
// Begin file-processing-basic-t2 variables
variable "hermes_file_processing_basic_t2_bool" {
	type = bool
	default = false
}

variable "hermes_file_processing_basic_t2_non_pgp_bool" {
	type = bool
	default = false
}

variable "jd_name_basic_t2" {
	default = ""
}

variable "jd_timeout_basic_t2" {
	default = 60
}

variable "jd_container_vcpu_basic_t2" {
	default = ""
}

variable "jd_container_memory_basic_t2" {
	default = ""
}

variable "jd_tags_basic_t2" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name_basic_t2" {
	default = ""
}

variable "eb_rule_event_pattern_basic_t2" {
	default = {}
}

variable "eb_rule_tags_basic_t2" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_job_name_basic_t2" {
	default = ""
}

variable "et_transformer_input_paths_basic_t2" {
	default = ""
}

variable "et_transformer_input_template_basic_t2" {
	default = ""
}
// End file-processing-basic-t2 variables
// Begin file-processing-medium variables
variable "hermes_file_processing_medium_bool" {
	type = bool
	default = false
}

variable "hermes_file_processing_medium_non_pgp_bool" {
	type = bool
	default = false
}

variable "jd_name_medium" {
	default = ""
}

variable "jd_timeout_medium" {
	default = 60
}

variable "jd_container_vcpu_medium" {
	default = ""
}

variable "jd_container_memory_medium" {
	default = ""
}

variable "jd_tags_medium" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name_medium" {
	default = ""
}

variable "eb_rule_event_pattern_medium" {
	default = {}
}

variable "eb_rule_tags_medium" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_job_name_medium" {
	default = ""
}

variable "et_transformer_input_paths_medium" {
	default = ""
}

variable "et_transformer_input_template_medium" {
	default = ""
}
// End file-processing-medium variables
// Begin file-processing-medium-t1 variables
variable "hermes_file_processing_medium_t1_bool" {
	type = bool
	default = false
}

variable "hermes_file_processing_medium_t1_non_pgp_bool" {
	type = bool
	default = false
}

variable "jd_name_medium_t1" {
	default = ""
}

variable "jd_timeout_medium_t1" {
	default = 60
}

variable "jd_container_vcpu_medium_t1" {
	default = ""
}

variable "jd_container_memory_medium_t1" {
	default = ""
}

variable "jd_tags_medium_t1" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name_medium_t1" {
	default = ""
}

variable "eb_rule_event_pattern_medium_t1" {
	default = {}
}

variable "eb_rule_tags_medium_t1" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_job_name_medium_t1" {
	default = ""
}

variable "et_transformer_input_paths_medium_t1" {
	default = ""
}

variable "et_transformer_input_template_medium_t1" {
	default = ""
}
// End file-processing-medium-t1 variables
// Begin file-processing-xlarge variables
variable "hermes_file_processing_xlarge_bool" {
	type = bool
	default = false
}

variable "hermes_file_processing_xlarge_non_pgp_bool" {
	type = bool
	default = false
}

variable "jd_name_xlarge" {
	default = ""
}

variable "jd_timeout_xlarge" {
	default = 60
}

variable "jd_container_vcpu_xlarge" {
	default = ""
}

variable "jd_container_memory_xlarge" {
	default = ""
}

variable "jd_tags_xlarge" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "eb_rule_name_xlarge" {
	default = ""
}

variable "eb_rule_event_pattern_xlarge" {
	default = {}
}

variable "eb_rule_tags_xlarge" {
	type = map
	default = {
		"terraform" = "True"
	}
}

variable "event_target_job_name_xlarge" {
	default = ""
}

variable "et_transformer_input_paths_xlarge" {
	default = ""
}

variable "et_transformer_input_template_xlarge" {
	default = ""
}
// End file-processing-xlarge variables

// Begin xlarge variables
variable "ce_name_xlarge" {
	default = ""
}

variable "ce_cr_instance_type_xlarge" {
	type = list(string)
	default = []
}

variable "ce_cr_max_vcpus_xlarge" {
	default = ""
}

variable "jq_name_xlarge" {
	default = ""
}

variable "event_pattern_obj_key_prefix_xlarge" {
	default = ""
}
// End xlarge variables
// Begin 2xlarge variables
variable "ce_name_2xlarge" {
	default = ""
}

variable "ce_cr_instance_type_2xlarge" {
	type = list(string)
	default = []
}

variable "ce_cr_max_vcpus_2xlarge" {
	default = ""
}

variable "jq_name_2xlarge" {
	default = ""
}

variable "jd_name_2xlarge" {
	default = ""
}

variable "jd_timeout_2xlarge" {
	default = 60
}

variable "jd_container_vcpu_2xlarge" {
	default = ""
}

variable "jd_container_memory_2xlarge" {
	default = ""
}

variable "eb_rule_name_2xlarge" {
	default = ""
}

variable "eb_rule_event_pattern_2xlarge" {
	default = {}
}

variable "event_pattern_obj_key_prefix_2xlarge" {
	default = ""
}

variable "event_target_job_name_2xlarge" {
	default = ""
}

variable "et_transformer_input_template_2xlarge" {
	default = ""
}
// End 2xlarge variables
// Begin 4xlarge variables
variable "ce_name_4xlarge" {
	default = ""
}

variable "ce_cr_instance_type_4xlarge" {
	type = list(string)
	default = []
}

variable "ce_cr_max_vcpus_4xlarge" {
	default = ""
}

variable "jq_name_4xlarge" {
	default = ""
}

variable "jd_name_4xlarge" {
	default = ""
}

variable "jd_timeout_4xlarge" {
	default = 60
}

variable "jd_container_vcpu_4xlarge" {
	default = ""
}

variable "jd_container_memory_4xlarge" {
	default = ""
}

variable "eb_rule_name_4xlarge" {
	default = ""
}

variable "eb_rule_event_pattern_4xlarge" {
	default = {}
}

variable "event_pattern_obj_key_prefix_4xlarge" {
	default = ""
}

variable "event_target_job_name_4xlarge" {
	default = ""
}

variable "et_transformer_input_template_4xlarge" {
	default = ""
}
// End 4xlarge variables
// Begin 8xlarge variables
variable "ce_name_8xlarge" {
	default = ""
}

variable "ce_cr_instance_type_8xlarge" {
	type = list(string)
	default = []
}

variable "ce_cr_max_vcpus_8xlarge" {
	default = ""
}

variable "jq_name_8xlarge" {
	default = ""
}

variable "jd_name_8xlarge" {
	default = ""
}

variable "jd_timeout_8xlarge" {
	default = 60
}

variable "jd_container_vcpu_8xlarge" {
	default = ""
}

variable "jd_container_memory_8xlarge" {
	default = ""
}

variable "eb_rule_name_8xlarge" {
	default = ""
}

variable "eb_rule_event_pattern_8xlarge" {
	default = {}
}

variable "event_pattern_obj_key_prefix_8xlarge" {
	default = ""
}

variable "event_target_job_name_8xlarge" {
	default = ""
}

variable "et_transformer_input_template_8xlarge" {
	default = ""
}
// End 8xlarge variables
// Begin Non-PGP Variables
variable "eb_rule_name_basic_non_pgp" {
	default = ""
}

variable "eb_rule_event_pattern_basic_non_pgp" {
	default = {}
}

variable "event_target_job_name_basic_non_pgp" {
	default = ""
}

variable "eb_rule_name_basic_t1_non_pgp" {
	default = ""
}

variable "eb_rule_event_pattern_basic_t1_non_pgp" {
	default = {}
}

variable "event_target_job_name_basic_t1_non_pgp" {
	default = ""
}

variable "eb_rule_name_basic_t2_non_pgp" {
	default = ""
}

variable "eb_rule_event_pattern_basic_t2_non_pgp" {
	default = {}
}

variable "event_target_job_name_basic_t2_non_pgp" {
	default = ""
}

variable "eb_rule_name_medium_non_pgp" {
	default = ""
}

variable "eb_rule_event_pattern_medium_non_pgp" {
	default = {}
}

variable "event_target_job_name_medium_non_pgp" {
	default = ""
}

variable "eb_rule_name_medium_t1_non_pgp" {
	default = ""
}

variable "eb_rule_event_pattern_medium_t1_non_pgp" {
	default = {}
}

variable "event_target_job_name_medium_t1_non_pgp" {
	default = ""
}

variable "eb_rule_name_xlarge_non_pgp" {
	default = ""
}

variable "eb_rule_event_pattern_xlarge_non_pgp" {
	default = {}
}

variable "event_target_job_name_xlarge_non_pgp" {
	default = ""
}
// End Non-PGP Variables
// Begin SQS Queue Variables
variable "create_sqs_queue" {
	type = bool
	default = false
}

variable "sqs_queue_name" {
	default = ""
}

variable "sqs_visibility_timeout_seconds" {
	default = 30
}

variable "sqs_queue_tags" {
	default = ""
}

variable "sqs_user_arn" {
	default = ""
}
// End SQS Queue Variables

