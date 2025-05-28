#####SES Receipt Rule 
resource "aws_ses_receipt_rule" "this" {
  rule_set_name = "${var.rule_set_name}"
  name          = "${var.rule_name}"
  recipients    = "${var.recipients}"
  enabled       = "${var.enabled_bool}"
  scan_enabled  = "${var.scan_enabled_bool}"
  tls_policy 	= "${var.tls_policy_bool}"
  
  
  s3_action {
    bucket_name = "${var.bucket_name}"
    position = "${var.position}"
    topic_arn = "${var.topic_arn}"
    object_key_prefix = "${var.object_key_prefix}"
  }
}