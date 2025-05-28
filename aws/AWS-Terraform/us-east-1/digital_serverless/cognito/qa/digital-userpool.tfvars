user_pool_name                = "digital-userpool-qa"
estimated_number_of_users     = 1000

required_attributes = ["given_name", "family_name", "email"]

custom_attributes = [
  {
    name       = "coverageId"
    type       = "String"
    min_length = 1
    max_length = 10
    mutable    = true
  },
  {
    name       = "subUser"
    type       = "String"
    min_length = 1
    max_length = 256
    mutable    = true
  }
]

cognito_domain = "digital-qa1"

self_registration_enabled = true

email_provider = {
  send_email_with_ses = true
  ses_region          = "us-east-1"
  from_email_address  = "mahadev.metre@franklin-madison.com"
  from_sender_name    = "qa-confirmation@fmservice.com"
}

sms_role_arn = "arn:aws:iam::634621569833:role/service-role/digital-userpool-sms-role-qa"

message_templates = [
  {
    message_type     = "Verification message"
    message_delivery = ["SMS", "Email"]
  },
  {
    message_type     = "Invitation message"
    message_delivery = ["SMS", "Email"]
  },
  {
    message_type     = "MFA message"
    message_delivery = ["SMS"]
  }
]

app_client_name                 = "digital_app_client_qa"
auth_flow_session_duration      = 3
refresh_token_expiration_days   = 30
access_token_expiration_minutes = 1

authentication_flows = [
  "ALLOW_ADMIN_USER_PASSWORD_AUTH",
  "ALLOW_CUSTOM_AUTH",
  "ALLOW_REFRESH_TOKEN_AUTH",
  "ALLOW_USER_SRP_AUTH"
]

attribute_permissions = [
  { name = "address", permissions = ["read", "write"] },
  { name = "birthdate", permissions = ["read", "write"] },
  { name = "custom:coverageId", permissions = ["read", "write"] },
  { name = "custom:subUser", permissions = ["read", "write"] },
  { name = "email", permissions = ["read", "write"] },
  { name = "email_verified", permissions = ["read"] },
  { name = "family_name", permissions = ["read", "write"] },
  { name = "gender", permissions = ["read", "write"] },
  { name = "given_name", permissions = ["read", "write"] },
  { name = "locale", permissions = ["read", "write"] },
  { name = "middle_name", permissions = ["read", "write"] },
  { name = "name", permissions = ["read", "write"] },
  { name = "nickname", permissions = ["read", "write"] },
  { name = "phone_number", permissions = ["read", "write"] },
  { name = "phone_number_verified", permissions = ["read"] },
  { name = "picture", permissions = ["read", "write"] },
  { name = "preferred_username", permissions = ["read", "write"] },
  { name = "profile", permissions = ["read", "write"] },
  { name = "updated_at", permissions = ["read", "write"] },
  { name = "website", permissions = ["read", "write"] },
  { name = "zoneinfo", permissions = ["read", "write"] }
]

lambda_triggers = [
  { trigger_event = "Custom message", lambda_function_arn = "arn:aws:lambda:us-east-1:634621569833:function:selfservice-custom-trigger-qa" },
  { trigger_event = "Post confirmation", lambda_function_arn = "arn:aws:lambda:us-east-1:634621569833:function:selfservice-post-confirmation-qa" },
  { trigger_event = "Pre sign-up", lambda_function_arn = "arn:aws:lambda:us-east-1:634621569833:function:selfservice-pre-signup-qa" }
]                                                               

identity_pool_name               = "digital_identity_pool_qa"
allow_unauthenticated_identities = true
identity_provider_name = "cognito-idp.us-east-1.amazonaws.com/us-east-1_u69JT4Yju"
client_id     = "u69JT4Yju"

authenticated_role_arn       = "arn:aws:iam::634621569833:role/authenticated_role"
unauthenticated_role_arn     = "arn:aws:iam::634621569833:role/unauthenticated_role"

tags = {
  "ApplicationName"    = "Digital"
  "Automated"          = "True"
  "BackupPlan"         = "None"
  "CostCenter"         = "FMG"
  "CreatedBy"          = "DevOps"
  "CreatedOn"          = "08122024"
  "DataClassification" = "None"
  "Department"         = "DGT"
  "Infrastructure"     = "False"
  "LastUpdated"        = "08172024"
  "TechStack"          = "AWS"
  "Usage"              = "Project"
  "Version"            = "1.0"
}