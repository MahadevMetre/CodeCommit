data "aws_region" "digital_aws_region" {}
data "aws_caller_identity" "digital_aws_account_id" {}

resource "aws_iam_policy" "digital_email_tracking_policy" {
	count			=	var.digital_email_tracking_policy ? 1 : 0
	name			=	var.iam_policy_name
	description		=	var.iam_policy_desc
	tags			=	var.iam_policy_tags
	policy			=	jsonencode({
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"glue:GetTable",
				"glue:GetTableVersion",
				"glue:GetTableVersions"
			],
			"Resource": [
				"arn:aws:glue:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:catalog",
				"arn:aws:glue:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:database/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%",
				"arn:aws:glue:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:table/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
			]
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"kafka:GetBootstrapBrokers",
				"kafka:DescribeCluster",
				"kafka:DescribeClusterV2",
				"kafka-cluster:Connect"
			],
			"Resource": "arn:aws:kafka:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:cluster/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"kafka-cluster:DescribeTopic",
				"kafka-cluster:DescribeTopicDynamicConfiguration",
				"kafka-cluster:ReadData"
			],
			"Resource": "arn:aws:kafka:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:topic/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"kafka-cluster:DescribeGroup"
			],
			"Resource": "arn:aws:kafka:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:group/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/*"
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"s3:AbortMultipartUpload",
				"s3:GetBucketLocation",
				"s3:GetObject",
				"s3:ListBucket",
				"s3:ListBucketMultipartUploads",
				"s3:PutObject"
			],
			"Resource": [
				"${var.s3_bucket_arn}",
				"${var.s3_bucket_arn}/*"
			]
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"lambda:InvokeFunction",
				"lambda:GetFunctionConfiguration"
			],
			"Resource": "${var.lambda_arn}:*"
		},
		{
			"Effect": "Allow",
			"Action": [
				"kms:GenerateDataKey",
				"kms:Decrypt"
			],
			"Resource": [
				"arn:aws:kms:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:key/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
			],
			"Condition": {
				"StringEquals": {
					"kms:ViaService": "s3.${data.aws_region.digital_aws_region.name}.amazonaws.com"
				},
				"StringLike": {
					"kms:EncryptionContext:aws:s3:arn": [
						"arn:aws:s3:::%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%/*",
						"arn:aws:s3:::%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
					]
				}
			}
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"logs:PutLogEvents"
			],
			"Resource": [
				"arn:aws:logs:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:log-group:/aws/kinesisfirehose/${var.fs_stream_name}:*",
				"arn:aws:logs:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:log-group:%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%:log-stream:*"
			]
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"kinesis:DescribeStream",
				"kinesis:GetShardIterator",
				"kinesis:GetRecords",
				"kinesis:ListShards"
			],
			"Resource": "arn:aws:kinesis:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:stream/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
		},
		{
			"Effect": "Allow",
			"Action": [
				"kms:Decrypt"
			],
			"Resource": [
				"arn:aws:kms:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:key/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
			],
			"Condition": {
				"StringEquals": {
					"kms:ViaService": "kinesis.${data.aws_region.digital_aws_region.name}.amazonaws.com"
				},
				"StringLike": {
					"kms:EncryptionContext:aws:kinesis:arn": "arn:aws:kinesis:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:stream/%FIREHOSE_POLICY_TEMPLATE_PLACEHOLDER%"
				}
			}
		},
		{
			"Sid": "",
			"Effect": "Allow",
			"Action": [
				"firehose:PutRecordBatch"
			],
			"Resource": [
				"arn:aws:firehose:${data.aws_region.digital_aws_region.name}:${data.aws_caller_identity.digital_aws_account_id.account_id}:deliverystream/${var.fs_stream_name}"
			]
		}
	]
})
}

output "digital_email_tracking_policy_out" {
	value = length(aws_iam_policy.digital_email_tracking_policy) > 0 ? aws_iam_policy.digital_email_tracking_policy[0] : null
}