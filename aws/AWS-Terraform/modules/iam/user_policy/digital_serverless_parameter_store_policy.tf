resource "aws_iam_policy" "digital_serverless_parameter_store_policy" {
	count			=	var.digital_serverless_parameter_store_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:DescribeParameters"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                      "ssm:GetParameters",
                      "ssm:GetParameter",
            ],
            "Resource": "*"
        },
                {
            "Effect": "Allow",
            "Action": [
                      "kms:Decrypt"
            ],
            "Resource": "*"
        }
    ]
})
}