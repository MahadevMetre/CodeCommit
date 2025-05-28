#####SES Config Set destination

resource "aws_ses_event_destination" "this" {
  name                   = "${var.ses_destination_name}"
  configuration_set_name = "${var.aws_ses_configuration_set_name}"
  enabled                = true
  matching_types         = "${var.matching_types}"

  sns_destination {
    topic_arn = "${var.aws_sns_topic_arn}"
  }
}