module "ec2_instance" {
  source = "../../modules/compute/composite-ec2/"
  ebs_enabled          = var.ebs_enabled
  ebs_size              = var.ebs_size
  volume_type              = var.volume_type
  ebs_tags              = var.ebs_tags
  ebs_encrypted         = var.ebs_encrypted
  kms_key_id        = var.kms_key_id
  root_delete           = var.root_delete
  ami                           = var.ami
  instance_type                 = var.instance_type
  ec2_region             = var.ec2_region
  public_ip_bool   = var.public_ip_bool
  key_name                      = var.key_name
  efs_sg               = var.efs_sg
  subnet_id                     = var.subnet_id
  ec2_tags                          = var.ec2_tags
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  sg_name              = var.sg_name
  sg_description       = var.sg_description
  vpc_id            = var.vpc_id
  sg_ingress_rules  = var.sg_ingress_rules
  sg_tags              = var.sg_tags
  device_name         = var.device_name
  private_ip        =    var.private_ip
}

module "route53" {
	source	= "../../modules/route53/"
	zone_id	= var.r53_zone_id
	name	= var.r53_name
	type	= var.r53_type
	ttl		= var.r53_ttl
	records	= ["${var.private_ip}"]
}