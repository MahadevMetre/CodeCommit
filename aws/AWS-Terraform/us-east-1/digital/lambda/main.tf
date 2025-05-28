module "lambda" {
  source                           = "../../../modules/compute/generic_lambda"
  lambda_function_name             = var.lambda_function_name
  role                             = var.role
  description                      = var.description
  env_variables                    = var.env_variables
  tags                             = var.tags
  memory_size                      = var.memory_size
  ephemeral_storage_size           = var.ephemeral_storage_size
  timeout                          = var.timeout
  subnets                          = var.subnets
  security_groups                  = var.security_groups
  reserved_concurrent_executions   = var.reserved_concurrent_executions
  publish                          = var.publish
  runtime                          = var.runtime
  handler                          = var.handler
  filename                         = var.filename
  package_type                     = var.package_type
  source_code_hash                 = var.source_code_hash
  layers                           = var.layers
  snap_start_apply_on              = var.snap_start_apply_on
  attach_apigw_permission          = var.attach_apigw_permission
  apigw_arn                        = var.apigw_arn
  attach_sns_permission            = var.attach_sns_permission
  attach_s3_permission             = var.attach_s3_permission
  s3_bucket_statement_id           = var.s3_bucket_statement_id
  s3_bucket_account_id             = var.s3_bucket_account_id
  s3_bucket_arn                    = var.s3_bucket_arn
  api_description                  = var.api_description
  api_stage_name                   = var.api_stage_name
}


