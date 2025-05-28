output "verified_email_addresses" {
  value = aws_ses_email_identity.email_identity[*].email
}

# outputs.tf
output "bounce_topic_arn" {
  value = var.enable_sns_notifications ? aws_sns_topic.bounce_topic[0].arn : null
}
