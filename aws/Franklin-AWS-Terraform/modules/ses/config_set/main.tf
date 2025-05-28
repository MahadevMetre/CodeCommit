#####SES Config Set
resource "aws_ses_configuration_set" "this" {
  name = "${var.config_set_name}"
}