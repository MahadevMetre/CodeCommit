resource "aws_iam_user" "myIamUser" {
  name		=	var.iam_user_name
  tags		=	var.iam_user_tags
}