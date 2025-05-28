resource "aws_s3_bucket" "s3_bucket" {
  bucket              = "${var.s3_bucketName}-${var.environment}"
  acl                 = var.acl
  tags                = var.tags
  force_destroy       = var.force_destroy
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "block-public-access" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

module "s3-bucket-policy" {
  source                            = "../../s3/s3-policy/"
  s3_bucketName                     = aws_s3_bucket.s3_bucket.id
  bucket_arn						= aws_s3_bucket.s3_bucket.arn
  create_ins_bucket_policy          = var.create_ins_bucket_policy
  create_captiva_landing_zone_policy= var.create_captiva_landing_zone_policy
  create_platformconfig_bucket_policy= var.create_platformconfig_bucket_policy
  allowed_captiva_user_iam_arn_list = var.allowed_captiva_user_iam_arn_list
  allowed_ins_users_iam_arn_list    = var.allowed_ins_users_iam_arn_list
  s3_authorized_ip_list             = var.s3_authorized_ip_list
  s3_vpc_endpoint                   = var.s3_vpc_endpoint
  aws_referer						= var.aws_referer
  create_customer_communication_policy = var.create_customer_communication_policy
  allow_api_user_policy             = var.allow_api_user_policy
  allowed_api_user_list             = var.allowed_api_user_list
  allowed_read_only_user_list       = var.allowed_read_only_user_list
  alb_access_log_policy             = var.alb_access_log_policy
  jboss_alb                         = var.jboss_alb
  nginx_alb                         = var.nginx_alb
  dig_jboss_alb                     = var.dig_jboss_alb
  dig_jboss_nlb                     = var.dig_jboss_nlb
  dig_nginx_alb                     = var.dig_nginx_alb
  alb_access_log_policy_generic		= var.alb_access_log_policy_generic
}