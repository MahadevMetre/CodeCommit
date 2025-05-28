resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  version  = var.eks_cluster_version
  role_arn = aws_iam_role.eks_cluster_role.arn  
  vpc_config {
    endpoint_private_access = var.vpcconfig_endpoint_privateaccess
    endpoint_public_access = var.vpcconfig_endpoint_publicaccess
    subnet_ids = var.subnet_ids_for_eks_cluster
    security_group_ids = [ aws_security_group.ekscluster_sg.id ]
  }
  lifecycle {
  ignore_changes = [
    vpc_config
  ]
}

  tags = {
    "Name" = "DEV-FMG-ekscluster"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSServicePolicy
    # may add admin
  ]
}

resource "aws_kms_key" "encryption_key" {
  description = "encryption_key"
}

resource "aws_kms_key_policy" "eks_kms_policy" {
  key_id = aws_kms_key.encryption_key.id 
  policy = jsonencode({
    Id = "eks_kms_policy"
    Statement = [
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }

        Resource = "*"
        Sid      = "Enable IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}

# module "calico" {
#   source  = "git::https://github.com/DNXLabs/terraform-aws-eks-calico.git"
#   cluster_name = var.eks_cluster_name
#   vpc_id = var.vpc_id
#   subnets = var.subnet_ids_for_eks_cluster
# }
