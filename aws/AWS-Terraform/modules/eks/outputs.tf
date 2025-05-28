
output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks_cluster.certificate_authority
}

output "cluster-arn" {
  value = aws_eks_cluster.eks_cluster.arn
}
output "cluster-endpoint"{
    value = aws_eks_cluster.eks_cluster.endpoint
}
output "cluster-status" {
  value =  aws_eks_cluster.eks_cluster.status
}
/*output "eks_node_rolearn" {
  value = aws_iam_role.eks_nodes.arn
}*/
/*data "aws_iam_role" "eks_nodes" {
  name = var.eks_node_rolename
}
output "eks-noderole-name" {
  value = data.aws_iam_role.eks_nodes.name
}*/

output "eks-lbcontroller-policy-arn" {
value = aws_iam_policy.aws_loadbalancer_controller_iam_policy.arn
}