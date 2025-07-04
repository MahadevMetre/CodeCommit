resource "aws_launch_template" "eks_node_template" {
  name = var.eks_node_launchtemplate_name

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      encrypted = true
      kms_key_id = aws_kms_key.encryption_key.arn
      volume_size = var.ebs_rootvol_size["eks-defaultnodegroup"]
      volume_type = var.ebs_vol_type["default"]
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "DEV-FMG-eksworkernode"
    }
  }
}


resource "aws_eks_node_group" "default_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = var.default_node_group_name
  node_role_arn   = aws_iam_role.eks_nodes.arn    
  subnet_ids      = var.subnet_ids_for_eks_cluster_node_group
  instance_types  =   var.default_node_group_instance_type
 # disk_size = var.default_node_disk_size
  launch_template {
    id = aws_launch_template.eks_node_template.id
    version = "1"
  }
  tags = {
    "Name" = "DEV-FMG-defaultnodegroup"
  }
  scaling_config {
    desired_size = var.eks_desired_size_default_node
    max_size     = var.eks_max_size_default_node
    min_size     = var.eks_min_size_default_node
  }
  lifecycle {
    create_before_destroy ="true"
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEFSCSIDriverPolicy
  ]
}

# resource "aws_eks_node_group" "custom_node_group" {
#   cluster_name    = aws_eks_cluster.eks_cluster.name
#   count           = length(var.custom_node_group_name)
#   node_group_name = var.custom_node_group_name[count.index]
#   node_role_arn   = aws_iam_role.eks_nodes.arn 
#   subnet_ids      = var.subnet_ids_for_eks_cluster_node_group
#   instance_types  = [var.custom_node_group_instance_type[count.index]]

#   #disk_size = var.node_disk_size[count.index]
#   launch_template {
#     id = aws_launch_template.eks_node_template.id
#     version = "1"
#   }

#   tags = {
#     "Name" = "${var.project_name}-${var.environment}-customnodegroup"
#   }

#   scaling_config {
    
#     desired_size = var.eks_desired_size_custom_node[count.index]
#     max_size     = var.eks_max_size_custom_node[count.index]
#     min_size     = var.eks_min_size_custom_node[count.index]
#   }
  
#   lifecycle {
#     create_before_destroy ="true"
#   }
  
#   depends_on = [
#     aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
#     aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
#     aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
#     aws_iam_role_policy_attachment.AmazonEFSCSIDriverPolicy
#     #modified - AmazonEFSCSIDriverPolicy
#     # may add admin
#   ]
# }

#modified all below
# Define a map containing addon names and versions
locals {
  addons = {
    "coredns"                     = "v1.11.3-eksbuild.1"
    # "calico"                       = "v3.28.0" 
    "vpc-cni"                     = "v1.18.3-eksbuild.3"
    "kube-proxy"                  = "v1.30.3-eksbuild.5"
    "eks-pod-identity-agent"      = "v1.3.2-eksbuild.2"
    "aws-mountpoint-s3-csi-driver" = "v1.8.0-eksbuild.1"
    "aws-ebs-csi-driver"           = "v1.29.1-eksbuild.1"    #v1.29.1-eksbuild.1
  }
}

# Create aws_eks_addon resources using a for_each loop
resource "aws_eks_addon" "addons" {
  for_each    = local.addons
  depends_on  = [aws_eks_node_group.default_node_group]
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = each.key
  addon_version = each.value
}

# resource "aws_eks_addon" "calico_cni" {
#     count     = 1
#     depends_on = [aws_eks_node_group.default_node_group]
#     cluster_name = aws_eks_cluster.eks_cluster.name
#     addon_name   = "CalicoCNI"
#     addon_version = "v3.28.0"
# }
