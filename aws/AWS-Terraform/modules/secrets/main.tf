resource "aws_secretsmanager_secret" "my_secret" {
  name						= var.secret_name
  description				= var.secret_description
  recovery_window_in_days	= var.secret_rc_window
  tags						= var.secret_tags
}

resource "aws_secretsmanager_secret_version" "my_secret" {
  secret_id     = aws_secretsmanager_secret.my_secret.id
  secret_string = jsonencode(var.secret_values)
  # The following block is added to ignore the secret value changes.
  # Comment out in case we need to update the secret values via terraform
  lifecycle {
	ignore_changes = [secret_string]
  }
}