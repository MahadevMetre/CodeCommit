module "ses_email_verification" {
  source = "../../modules/ses/ses_email"
  
  email_addresses = var.email_addresses
  enable_sns_notifications = var.enable_sns_notifications
}
