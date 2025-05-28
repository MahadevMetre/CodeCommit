module "ec2_instance" {
  source = "../ec2"

  #EBS Volume
  ec2_region            = var.ec2_region
  ebs_size              = var.ebs_size
  ebs2_size              = var.ebs2_size
  volume_type           = var.volume_type
  ebs_tags              = var.ebs_tags
  ebs_encrypted         = var.ebs_encrypted
  kms_key_id            = var.kms_key_id
  ebs_enabled          = var.ebs_enabled
  root_delete           = var.root_delete

  # ec2 instance
  ami                           = var.ami
  instance_type                 = var.instance_type
  public_ip_bool                = var.public_ip_bool
  key_name                      = var.key_name
  security_groups               = concat([module.security_group.security_group_id], var.efs_sg) // change by mmetre
  # security_groups               = concat(tolist([module.security_group.security_group]), var.efs_sg) // previous
  subnet_id                     = var.subnet_id
  tags                          = var.ec2_tags
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  private_ip                    = var.private_ip
  
  #Ec2 EBS Attachment
  device_name = var.device_name
}

module "security_group" {
  source = "../../networking/securitygroups"
  name              = var.sg_name
  description       = var.sg_description
  vpc_id            = var.vpc_id
  sg_ingress_rules  = var.sg_ingress_rules
  tags              = var.sg_tags
}

/*
module "sg_attachment" {
  source            = "../../networking/sg_attachment"
  sg_id             = module.security_group.security_group
  network_interface_id = module.ec2_instance.ec2_out.primary_network_interface_id
}*/