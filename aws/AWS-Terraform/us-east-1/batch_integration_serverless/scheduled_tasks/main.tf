locals {
  schedule_expression = var.schedule_type == "cron" ? "cron(${var.cron_expression})" : "rate(${var.rate_expression})"
}

locals {
  container_overrides = jsonencode({
    containerOverrides = [
      {
        name        = var.container_name  # Use the actual container name from the task definition
        command     = var.container_command  # The command override for the container
        environment = [  
          {
            name  = var.environmentname1
            value = var.jwt_token_expiry_mins
          },
          {
            name  = var.environmentname2
            value = var.log_level
          }
        ]
      }
    ]
  })
}

resource "aws_cloudwatch_event_rule" "ecs_schedule" {
  name                = var.scheduled_rule_name
  description         = var.scheduled_rule_description
  schedule_expression = local.schedule_expression
  state               = var.rule_state  # Changed from is_enabled to state
}

resource "aws_cloudwatch_event_target" "ecs_task" {
  rule      = aws_cloudwatch_event_rule.ecs_schedule.id
  target_id = var.target_id

  arn = var.cluster_arn
  ecs_target {
    task_count           = var.number_of_tasks
    task_definition_arn  = var.task_definition_arn
    launch_type          = var.launch_type
    platform_version     = var.platform_version

    network_configuration {
      subnets          = var.subnets
      security_groups  = var.security_groups
      assign_public_ip = var.assign_public_ip
    }
  }
  input = local.container_overrides
  # input = jsonencode({
  #   containerOverrides = [
  #     {
  #       name    = var.container_name  # Replace with your actual container name within the task definition
  #       command = var.container_command  
  #     }
  #   ]
  # })


  role_arn = var.eventbridge_iam_role_arn
}


