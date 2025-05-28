resource "aws_iam_role" "ui-logger-role" {
  name					= "ui-logger-role-${var.env}"
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

resource "aws_iam_role_policy" "ui-logger-policy" {
  name		= "ui-logger-policy-${var.env}"
  role		= aws_iam_role.ui-logger-role.id
  policy	= jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "BucketPolicy",
            "Effect": "Allow",
            "Action": "s3:PutObject*",
            "Resource": [
                "arn:aws:s3:::${var.project_name}-${var.env}/",
                "arn:aws:s3:::${var.project_name}-${var.env}/*"
            ]
        }
    ]
})
}

resource "aws_iam_role_policy_attachment" "attach_me" {
  policy_arn	= "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role			= aws_iam_role.ui-logger-role.id
}

data "archive_file" "python_lambda_package" {  
  type = "zip"  
  source_file = "py/ui_logger.py"
  output_path = "ui_logger_lambda_artifact.zip"
}

resource "aws_lambda_function" "ui_logger" {
  function_name		= "${var.project_name}-${var.env}"
  description		= var.lambda_desc
  filename			= "ui_logger_lambda_artifact.zip"
  source_code_hash	= data.archive_file.python_lambda_package.output_base64sha256
  role				= aws_iam_role.ui-logger-role.arn
  runtime			= var.lambda_runtime 
  handler			= "ui_logger.lambda_handler"
  memory_size		= var.lambda_memory
  timeout			= var.lambda_timeout
  tags				= var.tags
  environment {
	variables = {
		bucket_name = "${var.project_name}-${var.env}"
	}
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket	= "${var.project_name}-${var.env}"
  tags		= var.tags
}

resource "aws_s3_bucket_public_access_block" "block-public-access" {
  bucket					= aws_s3_bucket.bucket.id
  block_public_acls			= true
  block_public_policy		= true
  ignore_public_acls		= true
  restrict_public_buckets	= true
}

resource "aws_s3_bucket_lifecycle_configuration" "my_lifecycle_config" {
  bucket = aws_s3_bucket.bucket.id
  rule {
	id = "Delete_After_${var.s3_lifecycle_days}_Days"
	status = "Enabled"
	expiration {
		days = var.s3_lifecycle_days
	}
	noncurrent_version_expiration {
		newer_noncurrent_versions = var.noncurrent_version_expiration
		noncurrent_days 		  = var.noncurrent_days
	}
  }
}