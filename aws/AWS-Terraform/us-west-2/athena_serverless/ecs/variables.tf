variable "cluster_name" {
  type = string
}

variable "cluster_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "create_iam_role" {
	type = bool
	default = true
}

variable "iam_role_name" {
  type = string
  default = ""
}

variable "iam_role_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "cloudwatch_log_group_name" {
  type = string
}

variable "cloudwatch_log_group_retention" {}

variable "cloudwatch_log_group_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "cloudwatch_log_group_name2" {
  type = string
}

variable "cloudwatch_log_group_retention2" {}

variable "cloudwatch_log_group_tags2" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "cloudwatch_log_group_name3" {
  type = string
}

variable "cloudwatch_log_group_retention3" {}

variable "cloudwatch_log_group_tags3" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "cloudwatch_log_group_name4" {
  type = string
}

variable "cloudwatch_log_group_retention4" {}

variable "cloudwatch_log_group_tags4" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "task_definition_family" {}

variable "container_definition_name" {}

variable "container_definition_image" {}

variable "cd_portmapping_containerport" {}

variable "cd_portmapping_hostport" {}

variable "cd_portmapping_protocol" {}

variable "cd_env_vars" {
	type = list(map(string))
	default = []
}

variable "cd_mount_points" {
	default = []
}

variable "task_definition_cpu" {}

variable "task_definition_memory" {}

variable "td_execution_role_arn" {
	default = ""
}

variable "td_task_role_arn" {
	default = ""
}

variable "td_volumes" {
	type = map
	default = {}
}

variable "td_volume_name" {
	default = ""
}

variable "td_volume_fs_id" {
	default = ""
}

variable "td_volume_root_dir" {
	default = ""
}

variable "td_tags" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "service_name" {}

variable "service_subnets" {
  type = list(string)
  default = []
}

variable "service_sg" {
  type = list(string)
  default = []
}

variable "service_tg_arn" {}














variable "task_definition_family2" {}

variable "container_definition_name2" {}

variable "container_definition_image2" {}

variable "cd_portmapping_containerport2" {}

variable "cd_portmapping_hostport2" {}

variable "cd_portmapping_protocol2" {}

variable "cd_env_vars2" {
	type = list(map(string))
	default = []
}

variable "cd_mount_points2" {
	default = []
}

variable "task_definition_cpu2" {}

variable "task_definition_memory2" {}

variable "td_execution_role_arn2" {
	default = ""
}

variable "td_task_role_arn2" {
	default = ""
}

variable "td_volumes2" {
	type = map
	default = {}
}

variable "td_volume_name2" {
	default = ""
}

variable "td_volume_fs_id2" {
	default = ""
}

variable "td_volume_root_dir2" {
	default = ""
}

variable "td_tags2" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "service_name2" {}

variable "service_subnets2" {
  type = list(string)
  default = []
}

variable "service_sg2" {
  type = list(string)
  default = []
}

variable "service_tg_arn2" {}











variable "task_definition_family3" {}

variable "container_definition_name3" {}

variable "container_definition_image3" {}

variable "cd_portmapping_containerport3" {}

variable "cd_portmapping_hostport3" {}

variable "cd_portmapping_protocol3" {}

variable "cd_env_vars3" {
	type = list(map(string))
	default = []
}

variable "cd_mount_points3" {
	default = []
}

variable "task_definition_cpu3" {}

variable "task_definition_memory3" {}

variable "td_execution_role_arn3" {
	default = ""
}

variable "td_task_role_arn3" {
	default = ""
}

variable "td_volumes3" {
	type = map
	default = {}
}

variable "td_volume_name3" {
	default = ""
}

variable "td_volume_fs_id3" {
	default = ""
}

variable "td_volume_root_dir3" {
	default = ""
}

variable "td_tags3" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "service_name3" {}

variable "service_subnets3" {
  type = list(string)
  default = []
}

variable "service_sg3" {
  type = list(string)
  default = []
}

variable "service_tg_arn3" {}











variable "task_definition_family4" {}

variable "container_definition_name4" {}

variable "container_definition_image4" {}

variable "cd_portmapping_containerport4" {}

variable "cd_portmapping_hostport4" {}

variable "cd_portmapping_protocol4" {}

variable "cd_env_vars4" {
	type = list(map(string))
	default = []
}

variable "cd_mount_points4" {
	default = []
}

variable "task_definition_cpu4" {}

variable "task_definition_memory4" {}

variable "td_execution_role_arn4" {
	default = ""
}

variable "td_task_role_arn4" {
	default = ""
}

variable "td_volumes4" {
	type = map
	default = {}
}

variable "td_volume_name4" {
	default = ""
}

variable "td_volume_fs_id4" {
	default = ""
}

variable "td_volume_root_dir4" {
	default = ""
}

variable "td_tags4" {
  type = map
  default = {
    "terraform" = "True"
  }
}

variable "service_name4" {}

variable "service_subnets4" {
  type = list(string)
  default = []
}

variable "service_sg4" {
  type = list(string)
  default = []
}

variable "service_tg_arn4" {}