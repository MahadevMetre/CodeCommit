variable "user_pool_name" {
  type        = string
}

variable "estimated_number_of_users" {
  type        = number
}

variable "required_attributes" {
  type        = list(string)
}

variable "custom_attributes" {
  type = list(object({
    name       = string
    type       = string
    min_length = number
    max_length = number
    mutable    = bool
  }))
}

variable "self_registration_enabled" {
  type        = bool
}

variable "email_provider" {
  type = object({
    send_email_with_ses = bool
    ses_region          = string
    from_email_address  = string
    from_sender_name    = string
  })
}

variable "sms_role_arn" {
  type        = string
}

variable "message_templates" {
  type = list(object({
    message_type     = string
    message_delivery = list(string)
  }))
}

variable "app_client_name" {
  type        = string
}

variable "auth_flow_session_duration" {
  type        = number
}

variable "refresh_token_expiration_days" {
  type        = number
}

variable "access_token_expiration_minutes" {
  type        = number
}

variable "authentication_flows" {
  type        = list(string)
}

variable "attribute_permissions" {
  type = list(object({
    name        = string
    permissions = list(string)
  }))
}

variable "lambda_triggers" {
  type = list(object({
    trigger_event      = string
    lambda_function_arn = string
  }))
}

variable "tags" {
  type = map(string)
}

variable "authenticated_role_arn" {
  type        = string
}

variable "unauthenticated_role_arn" {
  type        = string
}

variable "identity_pool_name" {
  type = string
}

variable "allow_unauthenticated_identities" {
  type    = bool
  default = false
}

variable "cognito_domain" {
  type        = string
}

variable "enable_token_revocation" {
  type        = bool
  default     = false
}

variable "identity_provider_name" {}

variable "client_id" {
  type        = string
}