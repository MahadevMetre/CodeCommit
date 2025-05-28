output "user_pool_id" {
  description = "The ID of the Cognito User Pool"
  value       = aws_cognito_user_pool.user_pool.id
}

output "user_pool_client_id" {
  description = "The ID of the Cognito User Pool Client"
  value       = aws_cognito_user_pool_client.user_pool_client.id
}

output "identity_pool_id" {
  description = "The ID of the Cognito Identity Pool"
  value       = aws_cognito_identity_pool.identity_pool.id
}

output "cognito_sms_role_arn" {
  value = aws_iam_role.cognito_sms_role.arn
}

output "cognito_user_pool_domain" {
  description = "The domain name for the Cognito User Pool"
  value       = aws_cognito_user_pool_domain.user_pool_domain.domain
}

output "authenticated_role_arn" {
  value = aws_iam_role.cognito_authenticated_role.arn
}

output "guest_role_arn" {
  value = aws_iam_role.cognito_guest_role.arn
}