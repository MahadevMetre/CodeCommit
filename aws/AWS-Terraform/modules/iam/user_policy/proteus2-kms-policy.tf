resource "aws_iam_policy" "proteus2_kms_policy" {
	count			=	var.proteus2_kms_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
	"Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "kms:Decrypt",
            "Resource": "arn:aws:kms:us-east-1:${data.aws_caller_identity.kms_acc_id.account_id}:key/*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::*/*"
        },
        {
			"Sid": "VisualEditor2",
			"Effect": "Allow",
			"Action": "s3:*",
			"Resource": "arn:aws:s3:::*"
		}
    ]
  })
}