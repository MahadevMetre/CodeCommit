resource "aws_iam_role" "role" {
  name               = var.role_name
  tags               = var.role_tags
  description        = var.iam_role_desc
  assume_role_policy = data.aws_iam_policy_document.cognito.json # Update based on resource for which Role is being created
}

module "iam-policy" {
  source                          = "../policy/"
  iam_role_id                     = aws_iam_role.role.id
  policy_name                     = var.policy_name
  cloudfront-sg-update-policy     = var.cloudfront-sg-update-policy
  cognito-admin-policy            = var.cognito-admin-policy
  ip-unauth-policy                = var.ip-unauth-policy
  parameter_arn                   = var.parameter_arn
  sqs_arn_val                     = var.sqs_arn_val
  lambda-inline-policy            = var.lambda-inline-policy
  marketing-inline-policy         = var.marketing-inline-policy
  user_group_policy               = var.user_group_policy
  ec2-start-stop-policy           = var.ec2-start-stop-policy
  hermes-job-launcher-role-policy = var.hermes-job-launcher-role-policy
  batch-job-launcher-role-policy  = var.batch-job-launcher-role-policy
  marketing-vanity-lambda-policy  = var.marketing-vanity-lambda-policy
  s3_bucket_name                  = var.s3_bucket_name
  secrets_name                    = var.secrets_name
  digital-serverless-parameter    = var.digital-serverless-parameter
  kms_key                         = var.kms_key
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "lambda" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "redshift" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["redshift.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda_eventbridge" {
  statement {
    sid     = "LambdaAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
  statement {
    sid     = "EventBridgeAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = ["data.aws_caller_identity.current.account_id"]
    }
    condition {
      test     = "StringLike"
      variable = "aws:SourceArn"
      values   = ["var.eventbridge_scheduler_source_arn"]
    }
  }
}

data "aws_iam_policy_document" "digital_lambda_eventbridge" {
  statement {
    sid     = "LambdaAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
  statement {
    sid     = "EventBridgeAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }
  }
  statement {
    sid     = "EventBridgeAssumeRole2"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }
  statement {
    sid     = "EventBridgeAssumeRole3"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}


data "aws_iam_policy_document" "firehose_ses" {
  statement {
    sid     = "FirehoseAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["firehose.amazonaws.com"]
    }
  }
  statement {
    sid     = "SESAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ses.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "apigateway" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "codecommit" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["codecommit.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "cognito" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = ["cognito-identity.amazonaws.com"]
    }
    condition {
      test     = "StringEquals"
      values   = ["us-east-1:"] # Update the cognito pool name
      variable = "cognito-identity.amazonaws.com:aud"
    }
  }
}

data "aws_iam_policy_document" "rds" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  count      = var.lambda_execution ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_connect" {
  count      = var.lambda_vpc_connect ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "api_gtwy_cloudwatch_push" {
  count      = var.api_gtwy_cloudwatch_attach ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

resource "aws_iam_role_policy_attachment" "AWSLambdaVPCAccessExecutionRole" {
  count      = var.AWSLambdaVPCAccessExecutionRole ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "SecretsManagerReadWrite" {
  count      = var.SecretsManagerReadWrite ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "lambda-invoke-policy" {
  count      = var.lambda-invoke-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.lambda_invoke_policy_arn
}

resource "aws_iam_role_policy_attachment" "lasso-logger-policy" {
  count      = var.lasso-logger-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.lasso_logger_policy_arn
}

resource "aws_iam_role_policy_attachment" "lasso-rds-proxy-policy" {
  count      = var.lasso-rds-proxy-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.lasso_rds_proxy_policy_arn
}

resource "aws_iam_role_policy_attachment" "lasso-s3-access-policy" {
  count      = var.lasso-s3-access-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.lasso_s3_access_policy_arn
}

resource "aws_iam_role_policy_attachment" "lasso-secrets-manager-policy" {
  count      = var.lasso-secrets-manager-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.lasso_secrets_manager_policy_arn
}

resource "aws_iam_role_policy_attachment" "lasso-vpc-access-policy" {
  count      = var.lasso-vpc-access-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.lasso_vpc_access_policy_arn
}

resource "aws_iam_role_policy_attachment" "ses-access-policy" {
  count      = var.ses-access-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.ses_access_policy_arn
}

resource "aws_iam_role_policy_attachment" "hermes-secrets-manager-policy" {
  count      = var.hermes-secrets-manager-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.hermes_secrets_manager_policy_arn
}

resource "aws_iam_role_policy_attachment" "digital-email-tracking-policy" {
  count      = var.digital_email_tracking_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.digital_email_tracking_policy_arn
}

resource "aws_iam_role_policy_attachment" "digital-logger-policy" {
  count      = var.digital-logger-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.digital_logger_policy_arn
}

resource "aws_iam_role_policy_attachment" "digital-ecr-docker-policy" {
  count      = var.digital-ecr-docker-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.digital_ecr_docker_policy_arn
}

resource "aws_iam_role_policy_attachment" "digital-secrets-manager-policy" {
  count      = var.digital-secrets-manager-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.digital_secrets_manager_policy_arn
}

resource "aws_iam_role_policy_attachment" "digital-vpc-access-policy" {
  count      = var.digital-vpc-access-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.digital_vpc_access_policy_arn
}

resource "aws_iam_role_policy_attachment" "admins_policy" {
  count      = var.admins_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.admins_policy_arn
}

resource "aws_iam_role_policy_attachment" "automation_qa_lead_policy" {
  count      = var.automation_qa_lead_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.automation_qa_lead_policy_arn
}

resource "aws_iam_role_policy_attachment" "leads_policy" {
  count      = var.leads_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.leads_policy_arn
}

resource "aws_iam_role_policy_attachment" "rml_policy" {
  count      = var.rml_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.rml_policy_arn
}

resource "aws_iam_role_policy_attachment" "support_ui_dev_policy" {
  count      = var.support_ui_dev_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.support_ui_dev_policy_arn
}

resource "aws_iam_role_policy_attachment" "ui_dev_policy" {
  count      = var.ui_dev_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.ui_dev_policy_arn
}

resource "aws_iam_role_policy_attachment" "dashboard-logger-policy" {
  count      = var.dashboard-logger-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.dashboard_logger_policy_arn
}

resource "aws_iam_role_policy_attachment" "dashboard-vpc-access-policy" {
  count      = var.dashboard-vpc-access-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.dashboard_vpc_access_policy_arn
}

resource "aws_iam_role_policy_attachment" "marketing-dynamodb-policy" {
  count      = var.marketing-dynamodb-policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.marketing_dynamodb_policy_arn
}

resource "aws_iam_role_policy_attachment" "marketing_kms_policy" {
  count      = var.marketing_kms_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.marketing_kms_policy_arn
}

resource "aws_iam_role_policy_attachment" "proteus2_acxiom_olmb_lambda_policy" {
  count      = var.proteus2_acxiom_olmb_lambda_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.proteus2_acxiom_olmb_lambda_policy_arn
}

resource "aws_iam_role_policy_attachment" "proteus2_kms_policy" {
  count      = var.proteus2_kms_policy ? 1 : 0
  role       = aws_iam_role.role.name
  policy_arn = var.proteus2_kms_policy_arn
}
