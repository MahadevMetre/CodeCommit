output "security_group"{
  value = aws_security_group.security_group.id
}

output "sgOut"{
  value = aws_security_group.security_group
}