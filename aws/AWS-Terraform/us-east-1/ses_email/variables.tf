variable "email_addresses" {
  description = "List of email addresses to verify in SES"
  type        = list(string)
}

variable "enable_sns_notifications" {
  description = "Enable SNS bounce and complaint notifications"
  type        = bool
  default     = false
}
