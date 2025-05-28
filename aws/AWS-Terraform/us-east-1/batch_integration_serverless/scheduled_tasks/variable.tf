variable "schedule_type" {
  description = "Type of schedule to use; accepts 'cron' or 'rate'."
  type        = string
  # default     = "rate"  # Default to 'rate' but can be overridden to 'cron'
}

variable "cron_expression" {
  description = "The cron expression to use if 'cron' is selected as the schedule type."
  type        = string
  # default     = "0 18 ? * MON-FRI *"  # Example: Every weekday at 18:00
}

variable "rate_expression" {
  description = "The rate expression to use if 'rate' is selected as the schedule type."
  type        = string
  # default     = "5 minutes"  # Example: Every 5 minutes
}


variable "scheduled_rule_name" {
  description = "The name of the EventBridge scheduled rule."
}

variable "scheduled_rule_description" {
  description = "A description for the EventBridge scheduled rule."
}

# variable "schedule_expression" {
#   description = "The scheduling expression specifying when the EventBridge rule should trigger."
# }

variable "rule_state" { 
  description = "The state of the rule, either ENABLED or DISABLED."
  default     = "ENABLED"
}

variable "target_id" {
  description = "The unique target ID within the EventBridge rule."
}

variable "cluster_arn" {
  description = "The ARN of the ECS cluster where the task is launched."
}

variable "launch_type" {
  description = "The launch type on which to run your ECS task."
}

variable "platform_version" {
  description = "The platform version on which to run your service."
}

variable "task_definition_arn" {
  description = "The ARN of the existing ECS task definition."
}

variable "subnets" {
  description = "List of subnet IDs for task placement."
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs associated with the task or service."
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the ENI."
}

variable "number_of_tasks" {
  description = "The number of ECS tasks to run."
  type        = number
}

variable "eventbridge_iam_role_arn" {
  description = "The ARN of the IAM role that EventBridge uses to call AWS services on your behalf."
}

variable "container_name" {
  description = "Name of the container within the ECS task definition to which commands are overridden."
  type        = string
}

variable "container_command" {
  description = "Command to be executed in the container."
  type        = list(string)
}

variable "jwt_token_expiry_mins" {
  description = "Expiration time in minutes for JWT tokens"
  type        = string
  default     = "30"
}

variable "log_level" {
  description = "Log level for the application"
  type        = string
  default     = "DEBUG"
}

variable "environmentname1" {
  description = "Expiration time in minutes for JWT tokens"
  type        = string
  default     = "30"
}

variable "environmentname2" {
  description = "Log level for the application"
  type        = string
  default     = "DEBUG"
}