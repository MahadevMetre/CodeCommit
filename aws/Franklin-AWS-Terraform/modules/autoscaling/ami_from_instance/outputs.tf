output "get_ami" {
    value = aws_ami_from_instance.get_ami.id
}