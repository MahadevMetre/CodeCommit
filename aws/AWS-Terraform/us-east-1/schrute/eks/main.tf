module "eks" {
  source = "../../../modules/eks"
  # environment                      = var.environment
  # project_name                     = var.project_name
  # aws_region                       = var.aws_region
  eks_cluster_name                 = var.eks_cluster_name
  eks_cluster_version              = var.eks_cluster_version
  vpcconfig_endpoint_privateaccess = var.vpcconfig_endpoint_privateaccess
  vpcconfig_endpoint_publicaccess  = var.vpcconfig_endpoint_publicaccess

  eks_cluster_rolename = var.eks_cluster_rolename
  eks_node_rolename    = var.eks_node_rolename

  vpc_id                                = var.vpc_id
  subnet_ids_for_eks_cluster            = concat(var.public_subnet_cidr_blocks, var.private_subnet_cidr_blocks) # modified
  subnet_ids_for_eks_cluster_node_group = var.private_subnet_cidr_blocks
  
  eks_node_launchtemplate_name     = var.eks_node_launchtemplate_name
  default_node_group_name          = var.default_node_group_name
  default_node_group_instance_type = var.default_node_group_instance_type
  default_node_disk_size           = var.default_node_disk_size
  eks_desired_size_default_node    = var.eks_desired_size_default_node
  eks_max_size_default_node        = var.eks_max_size_default_node
  eks_min_size_default_node        = var.eks_min_size_default_node

  # custom_node_group_name          = var.custom_node_group_name
  # custom_node_group_instance_type = var.custom_node_group_instance_type
  # custom_node_disk_size           = var.custom_node_disk_size
  # eks_desired_size_custom_node    = var.eks_desired_size_custom_node
  # eks_min_size_custom_node        = var.eks_min_size_custom_node
  # eks_max_size_custom_node        = var.eks_max_size_custom_node

  ebs_rootvol_size = var.ebs_rootvol_size
  ebs_vol_type     = var.ebs_vol_type

  eksclustersg_ingress_rules = var.eksclustersg_ingress_rules

  ekslbcontroller_iamrolename   = var.ekslbcontroller_iamrolename
  ekslbcontroller_iampolicyname = var.ekslbcontroller_iampolicyname
  # bastionhost_iamrole_name = var.bastionhost_iamrole_name
}
# module "ec2" {
#   source = "../../../modules/ec2"
#   # environment                         = var.environment
#   # project_name                        = var.project_name
#   # aws_region                          = var.aws_region
#   vpc_id                              = var.vpc_id
#   public_subnet_ids                   = var.public_subnet_cidr_blocks
#   associate_public_ip_address         = var.associate_public_ip_address
#   keypairname                         = var.keypairname
#   instanceType                        = var.instanceType
#   bastionhost_iamrole_name            = var.bastionhost_iamrole_name
#   bastionhost_iaminstanceprofile_name = var.bastionhost_iaminstanceprofile_name
#   bastionsg_ingress_rules             = var.bastionsg_ingress_rules
#   ebs_rootvol_size                    = var.ebs_rootvol_size
#   ebs_vol_type                        = var.ebs_vol_type
#   # aws_access_key_id = var.aws_access_key_id
#   # aws_secret_access_key = var.aws_secret_access_key
#   # eks_cluster_name                   = var.eks_cluster_name
#   # ekslbcontroller_iamrolename        = var.ekslbcontroller_iamrolename
#   # ekslbcontroller_serviceaccountname = var.ekslbcontroller_serviceaccountname
#   # ekslbcontroller_iampolicyarn       = module.eks.eks-lbcontroller-policy-arn
#   depends_on                         = [module.eks]
# }
