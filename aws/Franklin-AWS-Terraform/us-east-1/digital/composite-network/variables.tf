## Launch template variables
variable "template_name" {}

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

/*variable "ebs_optimized" {
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

variable "ebs_volume_type" {}*/

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

variable "lt_security_groups" {
	type			=	list(string)
	default			=	[]
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
variable "lbl_certificate_arn" {}

variable "lbl_health_check_port" {}

variable "lbl_protocol" {}

variable "lbl_default_action_type" {}

variable "ssl_policy" {}

##ASG Schedule variables
variable "start_stop_schedule" {
  default     = false
}

variable "start_schedule_name" {
  type = string
  default =""
}

variable "stop_schedule_name" {
  type = string
  default =""
}

variable "stop_schedule_minsize" {
    default = 0
}

variable "schedule_maxsize" {
    default = 2
}

variable "stop_schedule_desired_capacity" {
    default = 0
}

variable "stop_schedule_start_time" {
  default = null
}

variable "start_schedule_start_time" {
  default = null
}

variable "start_schedule_minsize" {
    default = 0
}

variable "start_schedule_desired_capacity" {
    default = 0
}

variable "start_schedule_recurrence" {
  default = null
}

variable "stop_schedule_recurrence" {
  default = null
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

// loadbalancer variables
variable "lb_name" {}

variable "lb_type" {}

variable "lb_tags" {
	type			=	map(string)
	default			=	{
							"terraform"	= "True"
						}
}

variable "lb_subnets" {
	type			=	list(string)
	default			=	[]
}

variable "lb_security_groups" {
	type			=	list(string)
	default			=	[]
}

variable "lb_enable_deletion_protection" {
	default			=	true
}

variable "lb_internal_bool" {
	type			=	bool
	default			=	true
}

variable "lb_bucket_name" {}

variable "lb_idle_timeout" {
    default = 60
}

// target_group variables
variable "tg_name" {}

variable "tg_health_check_port" {}

variable "tg_protocol" {}

variable "tg_vpc_id" {}

variable "tg_protocol_version" {}

variable "tg_healthy_threshold" {}

variable "tg_interval" {}

variable "tg_unhealthy_threshold" {}

variable "tg_health_check_timeout" {}

variable "tg_load_balancing_algorithm_type" {}

variable "tg_tags" {
  type = map
  default = {}
}

#Route53
variable "zone_id" {}

variable "route53_name" {}

variable "route53_type" {}

variable "ttl" {}

variable "create_route53_entry" {
	type			=	bool
	default			=	true
}