resource "aws_iam_policy" "lasso_rds_proxy_policy" {
	count			=	var.lasso_rds_proxy_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "rds-db:connect",
            "Resource": "${var.lasso_rds_dbuser_arn}"
        }
    ]
})
}