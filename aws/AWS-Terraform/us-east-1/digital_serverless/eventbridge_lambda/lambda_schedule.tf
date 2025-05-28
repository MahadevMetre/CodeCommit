data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

resource "aws_iam_role" "scheduler_role" {
  name = "Embedded-Lambda-Invoke-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "scheduler.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "scheduler_policy" {
  name        = "amazon-eventbridge-scheduler-execution-policy"
  description = "Policy for EventBridge Scheduler to invoke Lambda functions"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "lambda:InvokeFunction"
        Resource = [
          "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${var.lambda_function_name}"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "scheduler_policy_attachment" {
  role       = aws_iam_role.scheduler_role.name
  policy_arn = aws_iam_policy.scheduler_policy.arn
}

# Schedule group creation
resource "aws_scheduler_schedule_group" "lambda_schedule_group" {
  name = "Embedded-APIs-WarmUp-Group"
}

# Schedule enabled from 10 AM to 10 PM IST, Monday to Friday
resource "aws_scheduler_schedule" "enable_lambda_schedule" {
  name = "Embedded-APIs-WarmUp"
  group_name = aws_scheduler_schedule_group.lambda_schedule_group.name
  description = "Schedule to enable Lambda trigger every 5 minutes from 10 AM to 10 PM IST, Monday to Friday"

  flexible_time_window {
    mode = "OFF"
  }

  state = "ENABLED"
  # schedule_expression = "cron(0/5 5-16 ? * MON-FRI *)"  # Every 5 minutes between 10 AM and 10 PM IST
  schedule_expression = "rate(3 minutes)"
  schedule_expression_timezone = "Asia/Kolkata"

  target {
    arn     = "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:${var.lambda_function_name}"
    role_arn = aws_iam_role.scheduler_role.arn
    input   = jsonencode({
      "functionMode" = "lambdaWarm"
    })

    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts = "0"
    }
  }
}