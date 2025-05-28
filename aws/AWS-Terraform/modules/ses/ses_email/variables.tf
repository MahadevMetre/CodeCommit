variable "email_addresses" {
  description = "List of email addresses to verify in SES"
  type        = list(string)
}

variable "enable_sns_notifications" {
  description = "Whether to enable SNS notifications for bounces and complaints"
  type        = bool
  default     = false
}
