#####SES Rule Set
resource "aws_ses_receipt_rule_set" "this" {
  rule_set_name = var.rule_set_name
}