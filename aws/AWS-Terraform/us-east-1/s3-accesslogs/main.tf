module "s3_bucket" {
  source              = "../../modules/storage/s3-accesslog/s3-bucket"
  s3_bucketName       = var.s3_bucketName
  environment         = var.environment
  acl                 = var.acl
  tags                = var.tags
  force_destroy       = var.force_destroy  

  # Policy
  alb_access_log_policy             = var.alb_access_log_policy
  jboss_alb                         = var.jboss_alb
  nginx_alb                         = var.nginx_alb
  aws_referer                       = var.aws_referer
  dig_jboss_alb                     = var.dig_jboss_alb
  dig_jboss_nlb                     = var.dig_jboss_nlb
  dig_nginx_alb                     = var.dig_nginx_alb
  alb_access_log_policy_generic		= var.alb_access_log_policy_generic
  ecs_alb                           = var.ecs_alb
}