data "aws_caller_identity" "current" {}

resource "aws_iam_role" "pipe_role" {
  name = var.role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "pipes.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "api_gateway_policy" {
  name   = var.api_gateway_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "execute-api:Invoke",
        "execute-api:ManageConnections"
      ]
      Resource = "arn:aws:execute-api:${var.region}:${data.aws_caller_identity.current.account_id}:${var.api_id}/${var.stage}/${var.http_method}/${var.api_path}"
    }]
  })
}

resource "aws_iam_policy" "sqs_policy" {
  name   = var.sqs_policy_name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "sqs:ReceiveMessage",
        "sqs:DeleteMessage",
        "sqs:GetQueueAttributes"
      ]
      Resource = "arn:aws:sqs:${var.region}:${data.aws_caller_identity.current.account_id}:${var.source_queue_name}"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "api_gateway_policy_attachment" {
  policy_arn = aws_iam_policy.api_gateway_policy.arn
  role       = aws_iam_role.pipe_role.name
}

resource "aws_iam_role_policy_attachment" "sqs_policy_attachment" {
  policy_arn = aws_iam_policy.sqs_policy.arn
  role       = aws_iam_role.pipe_role.name
}


resource "aws_cloudwatch_log_group" "pipe_log_group" {
  name              = "/aws/events/${var.pipe_name}"
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

resource "aws_pipes_pipe" "pipes_pipe" {
  name      = var.pipe_name
  role_arn  = aws_iam_role.pipe_role.arn
  source    = var.source_arn
  target    = var.target_arn

  log_configuration {
    level  = var.log_level
    cloudwatch_logs_log_destination {
      log_group_arn = aws_cloudwatch_log_group.pipe_log_group.arn
    }
  }

  source_parameters {
    sqs_queue_parameters {
      batch_size  = var.batch_size
    }
  }

  target_parameters {
    input_template = var.input_template
  }  
  tags = var.tags

  depends_on = [aws_cloudwatch_log_group.pipe_log_group]
}