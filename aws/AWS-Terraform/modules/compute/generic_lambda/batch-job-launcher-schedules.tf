resource "aws_scheduler_schedule_group" "batch_integration" {
  count = var.batch_job_launcher_schedules ? 1 : 0
  name  = "batch_integration"
  tags  = var.schedule_group_tags
}

resource "aws_scheduler_schedule" "mnl_claimsExtractJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-mnl_claimsExtractJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(2 16 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "mnl_claimsExtractJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "mnl_claimsTransferJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-mnl_claimsTransferJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(2 17 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "mnl_claimsFileTransferJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "chubb_claimsExtractJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-chubb_claimsExtractJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(4 16 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "chubb_claimsExtractJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "chubb_claimsTransferJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-chubb_claimsTransferJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(4 17 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "chubb_claimsFileTransferJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "sirius_claimsExtractJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-sirius_claimsExtractJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(0 16 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "sirius_claimsExtractJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "sirius_claimsTransferJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-sirius_claimsTransferJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(20 16 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "sirius_claimsFileTransferJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "zuric_claimsExtractJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-zuric_claimsExtractJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(10 16 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "zuric_claimsExtractJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "zuric_claimsFileTransferJob" {
  count      = var.batch_job_launcher_schedules ? 1 : 0
  name       = "batch-zuric_claimsFileTransferJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(55 16 ? * MON-FRI *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "rest/invokeJob",
      "jobName" : "zuric_claimsFileTransferJob",
      "processor" : "batchintegration-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "daily_aggregatorJob" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes_daily_aggregatorJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(10 18 * * ? *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "daily_aggregatorJob",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "email_aggregatorJob" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes_email_aggregatorJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(0,30 * * * ? *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "email_aggregatorJob",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "86400"
      maximum_retry_attempts       = "1"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "poeImageProcessor_job" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes-poeImageProcessor_job"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "rate(20 minutes)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "poeImageProcessor_job",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "86400"
      maximum_retry_attempts       = "3"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "preview_aggregatorJob" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes_preview_aggregatorJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(0 * * * ? *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "preview_aggregatorJob",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "86400"
      maximum_retry_attempts       = "3"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "regular_aggregatorJob" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes_regular_aggregatorJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(0,30 * * * ? *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "regular_aggregatorJob",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "86400"
      maximum_retry_attempts       = "1"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "reprint_aggregatorJob" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes_reprint_aggregatorJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(0 * * * ? *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "reprint_aggregatorJob",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "86400"
      maximum_retry_attempts       = "3"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

resource "aws_scheduler_schedule" "term_RateScheduleJob" {
  count      = var.hermes_job_launcher_schedules ? 1 : 0
  name       = "hermes_term_RateScheduleJob"
  group_name = aws_scheduler_schedule_group.batch_integration[0].id

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "cron(0 17 * * ? *)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "apiPath" : "batchJob/invokeJobAsync",
      "jobName" : "term_RateScheduleJob",
      "processor" : "hermesbatchprocessor-web"
    })
    retry_policy {
      maximum_event_age_in_seconds = "86400"
      maximum_retry_attempts       = "3"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}

# for PCI eventbridge_lambda
resource "aws_scheduler_schedule" "Embedded_APIs_WarmUp" {
  count      = var.marketing_lambda_warm_schedules ? 1 : 0
  name       = "Embedded-APIs-WarmUp_Test"
  group_name = "default"

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression          = "rate(15 minutes)"
  schedule_expression_timezone = "US/Central"

  target {
    arn      = aws_lambda_function.lambda.arn
    role_arn = var.role
    input = jsonencode({
      "functionMode" : "lambdaWarm"
    })
    retry_policy {
      maximum_event_age_in_seconds = "60"
      maximum_retry_attempts       = "0"
    }
  }

  state = "DISABLED"
  // Ignore any changes made to the variable state
  lifecycle {
    ignore_changes = [state]
  }
}
