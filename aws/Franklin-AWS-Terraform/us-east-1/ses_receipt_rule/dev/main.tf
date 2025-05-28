module "aws_ses_receipt_rule" {
  source ="../../../modules/ses/receipt_rule"
  rule_set_name = var.rule_set_name
  rule_name          = var.rule_name
  recipients    = var.recipients
  enabled_bool       = var.enabled_bool
  scan_enabled_bool  = var.scan_enabled_bool
  tls_policy_bool 	= var.tls_policy_bool
  
    bucket_name = var.bucket_name
    position = var.position
    topic_arn = var.topic_arn
    object_key_prefix = var.object_key_prefix
  
}