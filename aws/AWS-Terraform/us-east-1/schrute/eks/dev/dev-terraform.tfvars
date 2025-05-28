
#ebsvolumes-eks
ebs_rootvol_size = {
  # "bastion"              = "20"
  "eks-defaultnodegroup" = "20"
}
ebs_vol_type = {
  "default" = "gp3"
}




#vpcs
vpc_id = "vpc-00ff8e33839358d28"
public_subnet_cidr_blocks  = [""]
private_subnet_cidr_blocks = ["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
availability_zones         = ["us-east-1a", "us-east-1b"]

###################EKS#########################
#eks-cluster
eks_cluster_name                 = "DEV-FMG-eks"
eks_cluster_version              = "1.30"
vpcconfig_endpoint_privateaccess = "true"
vpcconfig_endpoint_publicaccess  = "false"

#eks-iam
eks_cluster_rolename = "DEV-FMG-eksclusterrole"
eks_node_rolename    = "DEV-FMG-eksnoderole"

#eks-sg
eksclustersg_ingress_rules = {
  https_access = { from = 443, to = 443, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow access to kube" },
  http_access  = { from = 80, to = 80, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow access to kube" },
  http_access  = { from = 31080, to = 31090, proto = "tcp", cidr = "0.0.0.0/0", desc = "Allow access to kube" }
}
#eks-launch template
eks_node_launchtemplate_name = "DEV-FMG-launchtemplate"
#eks-nodegroup
default_node_group_name          = "DEV-FMG-defaultnodegroup"
default_node_group_instance_type = ["c5.2xlarge"] # c4.2xlarge
default_node_disk_size           = 30
eks_desired_size_default_node    = 3
eks_max_size_default_node        = 5
eks_min_size_default_node        = 3

# #eks-custom nodegroup
# custom_node_group_name          = ["dev-customnodegroup"]
# custom_node_group_instance_type = ["t3a.large"]
# custom_node_disk_size           = [40]
# eks_desired_size_custom_node    = [1]
# eks_min_size_custom_node        = [1]
# eks_max_size_custom_node        = [2]

#eks-loadbalancer controller
ekslbcontroller_iamrolename        = "dev-fmg-EKSLoadBalancerControllerRole"
ekslbcontroller_iampolicyname      = "dev-fmg-AWSLoadBalancerControllerIAMPolicy"
ekslbcontroller_serviceaccountname = "dev-fmg-aws-load-balancer-controller-sa"
