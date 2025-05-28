resource "aws_iam_policy" "lambda_invoke_policy" {
	count			=	var.lambda_invoke_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeAsync",
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
})
}