variable "schedule_name" {}

variable "schedule_minsize" {
    default = 0
}

variable "schedule_maxsize" {
    default = 2
}

variable "schedule_desired_capacity" {
    default = 0
}

variable "schedule_start_time" {
}

variable "autoscaling_group_name" {}

variable "asg_schedule_recurrence" {}

variable "asg_schedule_timezone" {
	default = "Etc/GMT"
}