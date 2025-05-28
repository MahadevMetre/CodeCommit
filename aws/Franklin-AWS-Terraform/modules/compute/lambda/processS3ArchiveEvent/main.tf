resource "aws_lambda_function"  "lambda" {
  filename           = var.file_name
  function_name      = "${var.function_name}-${var.env}"
  handler            = var.handler
  runtime            = var.runtime
  role               = aws_iam_role.processS3ArchiveEvent-role.arn
  source_code_hash   = base64sha256(var.source_code_hash)
  memory_size        = var.memory_size
  timeout            = var.timeout
  kms_key_arn        = var.kms_key_arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  tags                 = var.tags
  environment {
    variables = {
      sqs_url = var.sqs_url
    }
  }
}


resource "aws_iam_role" "processS3ArchiveEvent-role" {
  name = "franklin-${var.env}-processS3ArchiveEvent-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "processS3ArchiveEvent-attach-lambda-exec-role" {
  role       = aws_iam_role.processS3ArchiveEvent-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}

resource "aws_iam_role_policy_attachment" "processS3ArchiveEvent-role-policy-attachment" {
  role       = aws_iam_role.processS3ArchiveEvent-role.name
  policy_arn = aws_iam_policy.processS3ArchiveEvent-policy.arn
}


resource "aws_iam_policy" "processS3ArchiveEvent-policy" {
  name        = "franklin-${var.env}-processS3ArchiveEvent-lambda-role-policy"
  description = "Policy for S3 Read SQS Send Message"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject"              
            ],
            "Resource": ${jsonencode(var.s3_bucket_arn_list)}
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "sqs:ListQueues",
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": "sqs:SendMessage",
            "Resource": ${jsonencode(var.sqs_arn_list)}
        }
    ]
}
EOF
}


### sts policy attachment to the role
resource "aws_iam_role_policy_attachment" "attach-sts-policy" {
  role       = aws_iam_role.processS3ArchiveEvent-role.name
  policy_arn = aws_iam_policy.sts-policy.arn
}

## sts policy for assuming role in franklin-prod aws account
resource "aws_iam_policy" "sts-policy" {
  name        = "franklin-${var.env}-processS3ArchiveEvent-lambda-role-sts-policy"
  description = "STS policy "

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "*"
        }
    ]
}
EOF
}
