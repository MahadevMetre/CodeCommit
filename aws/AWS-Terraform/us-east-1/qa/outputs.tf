output "instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.ec2_instance.id
}

output "ebs_volume_id" {
  description = "The ID of the EBS volume."
  value       = aws_ebs_volume.storage.id
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = aws_security_group.sg.id
}
