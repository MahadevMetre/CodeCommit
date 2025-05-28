module "ec2_instance" {
  source = "../../../modules/compute/ec2/"
  ebs_size              = var.ebs_size
  volume_type              = var.volume_type
  ebs_tags              = var.ebs_tags
  ebs_encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  ami                           = var.ami
  instance_type                 = var.instance_type
  ec2_region             = var.ec2_region
  public_ip_bool   = var.public_ip_bool
  key_name                      = var.key_name
  security_groups               = var.security_groups
  subnet_id                     = var.subnet_id
  tags                          = var.tags
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  private_ip        =    var.private_ip
}