## Launch template variables
variable "template_name" {}

variable "image_id" {}

variable "instance_type" {}

variable "key_name" {}

variable "template_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "associate_public_ip_address" {
  default     = false
}

variable "update_default_version" {
  default     = false
}

variable "ebs_optimized" {
  default     = false
}

variable "device_name" {}

variable "ebs_volume" {}

variable "ebs_delete" {
  default     = false
}

variable "ebs_encrypted" {
  default     = false
}

variable "ebs_volume_type" {}

variable "launch_template_monitoring" {
  default     = false
}

variable "resource_type" {}

variable "resource_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

## ASG 
variable "scaling_name" {}

variable "vpc_zone_identifier" {
  type = list(string)
  default = []
}

variable "max_size" {}

variable "min_size" {}

variable "health_check_type" {}

variable "launch_configuration" {
  default = ""
}

variable "termination_policies" {
  type = list(string)
  default = []
}

variable "enabled_metrics" {
  type = list(string)
  default = []
}

variable "health_check_grace_period" {}

variable "policy_name" {}

variable "template_version" {
  default = ""
}

variable "target_value" {
  default = 70
}

variable "autoscaling_tags" {
  default = [
    {
      key                 = "terraform"
      value               = "true"
      propagate_at_launch = false
    }
  ]
}

variable "scaling_desired_capacity" {
  default = 1
}

## LB Listener
// lb_listener variables
variable "lbl_loadbalancer_arn" {}

variable "lbl_certificate_arn" {}

variable "lbl_health_check_port" {}

variable "lbl_protocol" {}

variable "lbl_target_group_arn" {}

variable "lbl_default_action_type" {}

variable "ssl_policy" {}

##ASG Schedule variables
variable "start_stop_schedule" {
  default     = false
}

variable "start_schedule_name" {}

variable "stop_schedule_name" {}

variable "stop_schedule_minsize" {
    default = 0
}

variable "schedule_maxsize" {
    default = 2
}

variable "stop_schedule_desired_capacity" {
    default = 0
}

variable "stop_schedule_start_time" {}

variable "start_schedule_start_time" {}

variable "start_schedule_minsize" {
    default = 0
}

variable "start_schedule_desired_capacity" {
    default = 0
}

# AMI from instance
variable "ami_tags" {
  description = "A map of tags to add to all resources"
  type = map(string)
  default = {
    "terraform" = "True"
  }
}

variable "ami_name" {}

variable "source_instance_id" {}

#Asg Notification 
variable "notifications" {
  type = list(string)
  default = []
}

variable "topic_arn" {}