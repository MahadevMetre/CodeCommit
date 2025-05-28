resource "aws_iam_policy" "hermes_archival_process_policy" {
	count			=	var.hermes_archival_process_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
    "Version": "2012-10-17",
    "Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"s3:GetObject",
				"s3:DeleteObject",
				"s3:PutObject",
				"s3:PutObjectAcl"
				],
			"Resource": [
				"arn:aws:s3:::hermes-batch-processor-*/archival_job/error/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/archival_job/incoming/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/archival_job/processed/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/archival_job/stage/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/status_update/error/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/status_update/incoming/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/status_update/processed/*.json",
				"arn:aws:s3:::hermes-batch-processor-*/status_update/stage/*.json"
				]
		},
		{
			"Effect": "Allow",
			"Action": "s3:ListBucket",
			"Resource": "arn:aws:s3:::pycharm-serverless-*/*.json"
		},
		{
			"Effect": "Allow",
			"Action": "s3:GetObject",
			"Resource": "arn:aws:s3:::pycharm-serverless-*/*.pdf"
		},
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"s3:Create*",
				"s3:Delete*",
				"s3:Describe*",
				"s3:Get*",
				"s3:List*",
				"s3:Put*",
				"s3:Update*"
			],
			"Resource": [
				"arn:aws:s3:::pycharm-serverless-*",
				"arn:aws:s3:::hermes-file-integration-*",
				"arn:aws:s3:::hermes-batch-processor-*"
			]
		}
    ]
})
}