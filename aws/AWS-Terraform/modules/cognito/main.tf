data "aws_caller_identity" "current" {}

resource "aws_iam_role" "cognito_sms_role" {
  name = "${var.user_pool_name}-sms-role"
  tags = var.tags
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cognito-idp.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "cognito_sns_publish_policy" {
  name        = "${var.user_pool_name}-sns-publish-policy"
  description = "Policy allowing Cognito to publish SMS messages via SNS"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sns:Publish"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cognito_sns_policy_attachment" {
  role       = aws_iam_role.cognito_sms_role.name
  policy_arn = aws_iam_policy.cognito_sns_publish_policy.arn
}

resource "aws_cognito_user_pool" "user_pool" {
  name = var.user_pool_name
  tags = var.tags
  auto_verified_attributes = ["email"]
  
  mfa_configuration = "OPTIONAL"
  sms_configuration {
    sns_caller_arn = aws_iam_role.cognito_sms_role.arn
    external_id    = "external-id"
  }
  
  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }

  username_attributes = ["email"]
  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
    mutable             = false
  }

  dynamic "schema" {
    for_each = var.required_attributes
    content {
      attribute_data_type = "String"
      name                = schema.value
      required            = true
      mutable             = false
    }
  }

  dynamic "schema" {
    for_each = var.custom_attributes
    content {
      attribute_data_type = schema.value.type
      name                = schema.value.name
      required            = false
      mutable             = schema.value.mutable
      string_attribute_constraints {
        min_length = schema.value.min_length
        max_length = schema.value.max_length
      }
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = !var.self_registration_enabled
  }

  email_configuration {
    email_sending_account   = var.email_provider.send_email_with_ses ? "DEVELOPER" : "COGNITO_DEFAULT"
    source_arn              = var.email_provider.send_email_with_ses ? "arn:aws:ses:${var.email_provider.ses_region}:${data.aws_caller_identity.current.account_id}:identity/${var.email_provider.from_email_address}" : null
    from_email_address      = var.email_provider.from_email_address
    reply_to_email_address  = var.email_provider.from_email_address
  }

  lambda_config {
    custom_message         = var.lambda_triggers[0].lambda_function_arn
    post_confirmation      = var.lambda_triggers[1].lambda_function_arn
    pre_sign_up            = var.lambda_triggers[2].lambda_function_arn
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name                                 = var.app_client_name
  user_pool_id                         = aws_cognito_user_pool.user_pool.id
  refresh_token_validity               = var.refresh_token_expiration_days
  access_token_validity                = var.access_token_expiration_minutes
  allowed_oauth_flows_user_pool_client = false
  explicit_auth_flows                  = var.authentication_flows
  enable_token_revocation              = var.enable_token_revocation
}

resource "aws_cognito_user_pool_domain" "user_pool_domain" {
  domain       = var.cognito_domain
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "aws_cognito_identity_pool" "identity_pool" {
  identity_pool_name               = var.identity_pool_name
  allow_unauthenticated_identities = var.allow_unauthenticated_identities
  tags                             = var.tags
    cognito_identity_providers {
    provider_name = var.identity_provider_name
    client_id     = var.client_id
  }
}

resource "aws_iam_role" "cognito_authenticated_role" {
  name = "digital-cognito-ip-auth-role"
  tags = var.tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "cognito-identity.amazonaws.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "cognito-identity.amazonaws.com:aud": aws_cognito_identity_pool.identity_pool.id
          }
          "ForAnyValue:StringLike" = {
            "cognito-identity.amazonaws.com:amr": "authenticated"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "authenticated_role_policy" {
  name        = "digital_identity_pool_qa_auth_policy"
  description = "Policy for Cognito authenticated role"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "mobileanalytics:PutEvents",
          "cognito-sync:*",
          "cognito-identity:*"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = "execute-api:Invoke"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "authenticated_role_policy_attachment" {
  role       = aws_iam_role.cognito_authenticated_role.name
  policy_arn = aws_iam_policy.authenticated_role_policy.arn
}

resource "aws_iam_role" "cognito_guest_role" {
  name = "digital-cognito-ip-unauth-role"
  tags = var.tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "cognito-identity.amazonaws.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "cognito-identity.amazonaws.com:aud": aws_cognito_identity_pool.identity_pool.id
          }
          "ForAnyValue:StringLike" = {
            "cognito-identity.amazonaws.com:amr": "unauthenticated"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "unauthenticated_role_policy" {
  name        = "digital_identity_pool_qa_unauth_policy"
  description = "Policy for Cognito unauthenticated role"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "mobileanalytics:PutEvents",
          "cognito-sync:*"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = "execute-api:Invoke",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "unauthenticated_role_policy_attachment" {
  role       = aws_iam_role.cognito_guest_role.name
  policy_arn = aws_iam_policy.unauthenticated_role_policy.arn
}

resource "aws_cognito_identity_pool_roles_attachment" "identity_pool_roles_attachment" {
  identity_pool_id = aws_cognito_identity_pool.identity_pool.id
  roles = {
    authenticated   = aws_iam_role.cognito_authenticated_role.arn
    unauthenticated = aws_iam_role.cognito_guest_role.arn
  }
}