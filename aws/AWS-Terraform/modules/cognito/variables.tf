variable "user_pool_name" {
  description = "The name of the Cognito User Pool"
  type        = string
}

variable "estimated_number_of_users" {
  description = "Estimated number of users for the Cognito User Pool"
  type        = number
}

variable "required_attributes" {
  description = "List of required standard attributes"
  type        = list(string)
}

variable "custom_attributes" {
  description = "List of custom attributes"
  type = list(object({
    name             = string
    type             = string
    min_length       = number
    max_length       = number
    mutable          = bool
  }))
}

variable "self_registration_enabled" {
  description = "Enable or disable self-service sign-up"
  type        = bool
  default     = true
}

variable "email_provider" {
  description = "Email provider configuration"
  type = object({
    send_email_with_ses = bool
    ses_region          = string
    from_email_address  = string
    from_sender_name    = string
  })
}

variable "sms_role_arn" {
  description = "IAM role ARN for SMS messaging"
  type        = string
}

variable "message_templates" {
  description = "Configuration for message templates"
  type = list(object({
    message_type       = string
    message_delivery   = list(string)
  }))
}

variable "app_client_name" {
  description = "Name of the application client"
  type        = string
}

variable "auth_flow_session_duration" {
  description = "Duration for authentication flow sessions in minutes"
  type        = number
  default     = 3
}

variable "refresh_token_expiration_days" {
  description = "Refresh token expiration in days"
  type        = number
  default     = 30
}

variable "access_token_expiration_minutes" {
  description = "Access token expiration in minutes"
  type        = number
  default     = 24
}

variable "authentication_flows" {
  description = "List of allowed authentication flows"
  type        = list(string)
}

variable "attribute_permissions" {
  description = "Read and write permissions for attributes"
  type = list(object({
    name        = string
    permissions = list(string)
  }))
}

variable "lambda_triggers" {
  description = "Lambda triggers configuration"
  type = list(object({
    trigger_event      = string
    lambda_function_arn = string
  }))
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "authenticated_role_arn" {
  description = "ARN of the IAM role for authenticated users"
  type        = string
}

variable "unauthenticated_role_arn" {
  description = "ARN of the IAM role for unauthenticated users"
  type        = string
}

variable "identity_pool_name" {
  type = string
}
variable "allow_unauthenticated_identities" {
  type    = bool
  default = false
}

variable "allowed_oauth_flows" {
  description = "The OAuth 2.0 flows allowed for the user pool client."
  type        = list(string)
  default     = ["code", "implicit"]
}

variable "allowed_oauth_scopes" {
  description = "The OAuth 2.0 scopes allowed for the user pool client."
  type        = list(string)
  default     = ["phone", "email", "openid", "profile"]
}

variable "cognito_domain" {
  description = "The domain name for the Cognito User Pool"
  type        = string
}

variable "enable_token_revocation" {
  description = "Enable or disable token revocation for the user pool client"
  type        = bool
  default     = false
}

variable "identity_provider_name" {}

variable "client_id" {
  description = "The client ID for the identity provider"
  type        = string
}