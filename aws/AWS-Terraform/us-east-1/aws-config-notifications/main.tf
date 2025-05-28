data "aws_caller_identity" "current" {}

resource "aws_iam_role" "my_role" {
  name					= "aws-config-notifications-lambda-role-${var.env}"
  tags					= var.tags
  assume_role_policy	= jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
		  Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "my_policy" {
  name		= "aws-config-notifications-lambda-policy-${var.env}"
  role		= aws_iam_role.my_role.id
  policy	= jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "BucketPolicy",
            "Effect": "Allow",
            "Action": "s3:PutObject*",
            "Resource": [
                "arn:aws:s3:::${var.project_name}-${data.aws_caller_identity.current.account_id}-${var.env}/",
                "arn:aws:s3:::${var.project_name}-${data.aws_caller_identity.current.account_id}-${var.env}/*"
            ]
        },
        {
            "Sid": "SESPolicy",
            "Effect": "Allow",
            "Action": [
                "ses:SendEmail",
                "ses:SendRawEmail"
            ],
            "Resource": "*"
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "attach_me" {
  policy_arn	= "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role			= aws_iam_role.my_role.id
}

data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "py/aws-config-notifications.py"
  output_path = "aws-config-notifications.zip"
}

resource "aws_lambda_function" "my_lambda" {
  function_name		= "${var.project_name}-${var.env}"
  description		= var.lambda_desc
  filename			= "aws-config-notifications.zip"
  source_code_hash	= data.archive_file.python_lambda_package.output_base64sha256
  role				= aws_iam_role.my_role.arn
  runtime			= var.lambda_runtime 
  handler			= "aws-config-notifications.lambda_handler"
  memory_size		= var.lambda_memory
  timeout			= var.lambda_timeout
  tags				= var.tags
  environment {
		variables	= var.lambda_env_variables
	}
}

resource "aws_s3_bucket" "my_bucket" {
  bucket	= "${var.project_name}-${data.aws_caller_identity.current.account_id}-${var.env}"
  tags		= var.tags
}

resource "aws_s3_bucket_public_access_block" "block-public-access" {
  bucket					= aws_s3_bucket.my_bucket.id
  block_public_acls			= true
  block_public_policy		= true
  ignore_public_acls		= true
  restrict_public_buckets	= true
}

resource "aws_sns_topic" "my_topic" {
  count = var.create_sns_topic ? 1 : 0
  name = "${var.project_name}-topic-${var.env}"
  tags = var.tags
}

resource "aws_sns_topic_subscription" "my_subscription" {
  count = var.create_sns_topic ? 1 : 0
  topic_arn = aws_sns_topic.my_topic[0].arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.my_lambda.arn
}

resource "aws_sns_topic_policy" "default" {
  count = var.create_sns_topic ? 1 : 0
  arn = aws_sns_topic.my_topic[0].arn
  policy = data.aws_iam_policy_document.sns_topic_policy[0].json
}

resource "aws_lambda_permission" "sns_permission" {
  count = var.create_sns_topic ? 1 : 0
  statement_id  = "lambda-sns-trigger"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_lambda.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.my_topic[0].arn
}

data "aws_iam_policy_document" "sns_topic_policy" {
  count = var.create_sns_topic ? 1 : 0
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
	  "${data.aws_caller_identity.current.account_id}",
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.my_topic[0].arn,
    ]

    sid = "__default_statement_ID"
  }

  statement {
    actions = [
      "SNS:Publish"
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.my_topic[0].arn,
    ]

    sid = "__console_pub_0"
  }

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:Receive"
    ]

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.my_topic[0].arn,
    ]

    sid = "__console_sub_0"
  }
}