module "role" {
  source = "../../../../modules/iam/roles/"
  policy_name        = var.policy_name
  role_name          = var.role_name
  role_tags          = var.role_tags
  cloudfront-sg-update-policy = var.cloudfront-sg-update-policy
  cognito-admin-policy = var.cognito-admin-policy
  ip-unauth-policy = var.ip-unauth-policy
  ip-auth-policy = var.ip-auth-policy
  parameter_arn      = var.parameter_arn
  sqs_arn_val        = var.sqs_arn_val
  lambda-inline-policy = var.lambda-inline-policy
  marketing-inline-policy = var.marketing-inline-policy
  lambda_execution = var.lambda_execution
  lambda_vpc_connect = var.lambda_vpc_connect
}