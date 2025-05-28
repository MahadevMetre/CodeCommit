data "aws_caller_identity" "kms_acc_id_hms" {}

resource "aws_iam_policy" "hermes_file_process_policy" {
	count			=	var.hermes_file_process_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "kms:Decrypt",
            "Resource": "arn:aws:kms:us-east-1:${data.aws_caller_identity.kms_acc_id_hms.account_id}:alias/hermes*"
        },
		{
			"Effect": "Allow",
			"Action": [
				"s3:DeleteObject",
				"s3:GetObject",
				"s3:PutObject"
				],
			"Resource": "arn:aws:s3:::hermes-file-integration-*/*"
		}
    ]
})
}