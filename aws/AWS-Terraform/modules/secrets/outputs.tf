output "my_secret_out" {
  value = aws_secretsmanager_secret.my_secret
}

output "secret_arn" {
  value = aws_secretsmanager_secret.my_secret.arn
}

output "secret_version_id" {
  value = aws_secretsmanager_secret_version.my_secret.id
}

output "secret_values" {
  value = jsondecode(aws_secretsmanager_secret_version.my_secret.secret_string)
}