data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]    
  }
}

resource "aws_instance" "bastion_host" {
  
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instanceType  # Choose an appropriate instance type
  subnet_id              = var.public_subnet_ids[0]  # Replace with the subnet ID where you want to deploy the bastion host
  key_name               = var.keypairname  # Replace with your SSH key pair name
  iam_instance_profile = aws_iam_instance_profile.bastionhostinstance_profile.name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  root_block_device {
      volume_size = var.ebs_rootvol_size["bastion"]
      volume_type = var.ebs_vol_type["default"]
      encrypted = true
      tags = {
          # "Name" = "${var.project_name}-${var.environment}-bastionrootvol"
      }
    } 

  tags = {
    # Name = "${var.project_name}-${var.environment}-bastionhost"
  }

}
