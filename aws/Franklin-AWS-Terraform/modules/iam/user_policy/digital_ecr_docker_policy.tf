resource "aws_iam_policy" "digital_ecr_docker_policy" {
	count			=	var.digital_ecr_docker_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"ecr:GetDownloadUrlForLayer",
				"ecr:GetRepositoryPolicy",
				"ecr:SetRepositoryPolicy",
				"ecr:DescribeRepositories",
				"ecr:ListImages",
				"ecr:BatchGetImage"
			],
			"Resource": "*"
		}
	]
})
}