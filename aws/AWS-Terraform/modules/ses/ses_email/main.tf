resource "aws_ses_email_identity" "email_identity" {
  count = length(var.email_addresses)
  email = var.email_addresses[count.index]
}

resource "aws_sns_topic" "bounce_topic" {
  count = var.enable_sns_notifications ? 1 : 0
  
  name = "bounce-topic"
}

resource "aws_ses_identity_notification_topic" "bounce_notification" {
  count             = var.enable_sns_notifications ? length(var.email_addresses) : 0
  identity          = aws_ses_email_identity.email_identity[count.index].email
  notification_type = "Bounce"
  topic_arn         = aws_sns_topic.bounce_topic[0].arn
}

resource "aws_ses_identity_notification_topic" "complaint_notification" {
  count             = var.enable_sns_notifications ? length(var.email_addresses) : 0
  identity          = aws_ses_email_identity.email_identity[count.index].email
  notification_type = "Complaint"
  topic_arn         = aws_sns_topic.bounce_topic[0].arn
}
