data "aws_caller_identity" "current" {}

resource "aws_ecs_cluster" "my_cluster" {
	name = var.cluster_name
	setting {
		name  = "containerInsights"
		value = "disabled"
	}
	tags = var.cluster_tags
}

resource "aws_ecs_cluster_capacity_providers" "my_cluster_cp" {
	cluster_name = aws_ecs_cluster.my_cluster.name
	capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
	count = var.create_iam_role ? 1: 0
	name = var.iam_role_name
	assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
	tags = var.iam_role_tags
}

data "aws_iam_policy_document" "assume_role_policy" {
	statement {
		actions = ["sts:AssumeRole"]
		principals {
		type = "Service"
			identifiers = ["ecs-tasks.amazonaws.com"]
		}
		condition {
			test = "StringEquals"
			variable = "aws:SourceAccount"
			values = ["${data.aws_caller_identity.current.account_id}"]
		}
	}
	statement {
		actions = ["sts:AssumeRole"]
		principals {
		type = "Service"
			identifiers = ["events.amazonaws.com"]
		}
		condition {
			test = "StringEquals"
			variable = "aws:SourceAccount"
			values = ["${data.aws_caller_identity.current.account_id}"]
		}
	}
	statement {
		actions = ["sts:AssumeRole"]
		principals {
		type = "Service"
			identifiers = ["scheduler.amazonaws.com"]
		}
		condition {
			test = "StringEquals"
			variable = "aws:SourceAccount"
			values = ["${data.aws_caller_identity.current.account_id}"]
		}
	}
}

resource "aws_iam_role_policy_attachment" "AmazonECSTaskExecutionRolePolicy" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "AWSBatchFullAccess" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/AWSBatchFullAccess"
}

resource "aws_iam_role_policy_attachment" "SecretsManagerReadWrite" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

resource "aws_iam_role_policy_attachment" "AWSLambda_FullAccess" {
	count = var.create_iam_role ? 1: 0
	role = aws_iam_role.ecsTaskExecutionRole[0].name
	policy_arn = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
}

resource "aws_cloudwatch_log_group" "log-group" {
	name = var.cloudwatch_log_group_name
	retention_in_days = var.cloudwatch_log_group_retention
	tags = var.cloudwatch_log_group_tags
}

resource "aws_ecs_task_definition" "my_ecs_task_definition" {
	family = "${var.task_definition_family}"

	container_definitions = jsonencode([{
		name = var.container_definition_name
		image = var.container_definition_image
		essential = true

		logConfiguration = {
			logDriver = "awslogs"
			options = {
				awslogs-group = aws_cloudwatch_log_group.log-group.id
				awslogs-region = "us-east-1"
				awslogs-stream-prefix = "ecs"
			}
		}

		cpu = 0

		volumesFrom = []

		portMappings = [
		{
			containerPort = var.cd_portmapping_containerport
			hostPort = var.cd_portmapping_hostport
			protocol = var.cd_portmapping_protocol
		}
		]

		environment = var.cd_env_vars

		mountPoints = var.cd_mount_points

		networkMode = "awsvpc"
	}])

	requires_compatibilities	= ["EC2", "FARGATE"]
	network_mode				= "awsvpc"
	cpu							= var.task_definition_cpu
	memory						= var.task_definition_memory
	execution_role_arn			= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_execution_role_arn
	task_role_arn				= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_task_role_arn

	runtime_platform {
		operating_system_family = "LINUX"
		cpu_architecture        = "X86_64"
	}

	dynamic "volume" {
		for_each = var.td_volumes
		content {
			name = volume.value.td_volume_name
			efs_volume_configuration {
				file_system_id = volume.value.td_volume_fs_id
				root_directory = volume.value.td_volume_root_dir
			}
		}
	}

	tags = var.td_tags
}

data "aws_ecs_task_definition" "my_ecs_task_definition_data" {
	task_definition = aws_ecs_task_definition.my_ecs_task_definition.family
}

resource "aws_ecs_service" "my_ecs_service" {
	name                 = var.service_name
	cluster              = aws_ecs_cluster.my_cluster.id
	task_definition      = "${aws_ecs_task_definition.my_ecs_task_definition.family}:${max(aws_ecs_task_definition.my_ecs_task_definition.revision, data.aws_ecs_task_definition.my_ecs_task_definition_data.revision)}"
	launch_type          = "FARGATE"
	scheduling_strategy  = "REPLICA"
	desired_count        = 0
	force_new_deployment = true

	network_configuration {
		subnets				= var.service_subnets
		assign_public_ip	= false
		security_groups		= var.service_sg
	}

	load_balancer {
		target_group_arn	= var.service_tg_arn
		container_name		= var.container_definition_name
		container_port		= var.cd_portmapping_containerport
	}
	# The following block is added to ignore the service count changes which are made manually.
	# Comment out in case we need to update the desired_count via terraform

	deployment_controller {
        type = "ECS"
    }
    deployment_circuit_breaker {
        enable   = true
        rollback = true
    }
	lifecycle {
		ignore_changes = [desired_count]
	}
	tags = var.asg_tags
}


resource "aws_iam_policy" "Amazon_EventBridge_Invoke_Api_Destination" {
  name   = "Amazon_EventBridge_Invoke_Api_Destination"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["events:InvokeApiDestination"]
        Resource = "*"
      }
    ]
  })
  tags = var.asg_tags
}

resource "aws_iam_policy" "digital_serverless_parameter_store_policy" {
  name   = "digital_serverless_parameter_store_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ssm:DescribeParameters"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["ssm:GetParameters", "ssm:GetParameter"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["kms:Decrypt"]
        Resource = "*"
      }
    ]
  })
  tags = var.asg_tags
}

resource "aws_iam_policy" "digital_serverless_ses_policy" {
  name  = "digital_serverless_ses_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:SendEmail",
          "ses:SendRawEmail"
        ],
        Resource = [
          "arn:aws:ses:*:${data.aws_caller_identity.current.account_id}:template/*",
          "arn:aws:ses:*:${data.aws_caller_identity.current.account_id}:configuration-set/*",
          "arn:aws:ses:*:${data.aws_caller_identity.current.account_id}:identity/*"
        ]
      },
      {
        Effect = "Allow",
        Action = "ses:DeleteSuppressedDestination",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "Amazon_EventBridge_Invoke_Api_Destination_attachment" {
  count = var.create_iam_role ? 1 : 0
  role       = aws_iam_role.ecsTaskExecutionRole[0].name
  policy_arn = aws_iam_policy.Amazon_EventBridge_Invoke_Api_Destination.arn
}

resource "aws_iam_role_policy_attachment" "digital_serverless_parameter_store_policy_attachment" {
  count = var.create_iam_role ? 1 : 0
  role       = aws_iam_role.ecsTaskExecutionRole[0].name
  policy_arn = aws_iam_policy.digital_serverless_parameter_store_policy.arn
}

resource "aws_iam_role_policy_attachment" "digital_serverless_ses_policy_attachment" {
  count = var.create_iam_role ? 1 : 0
  role  = aws_iam_role.ecsTaskExecutionRole[0].name
  policy_arn = aws_iam_policy.digital_serverless_ses_policy.arn
}

resource "aws_appautoscaling_target" "ecs_service_scaling_target" {
  max_capacity       = var.ecs_max_capacity
  min_capacity       = var.ecs_min_capacity
  resource_id        = "service/${aws_ecs_cluster.my_cluster.name}/${aws_ecs_service.my_ecs_service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "ecs_service_scaling_policy" {
  name                   = var.ecs_scaling_policy_name
  policy_type            = "TargetTrackingScaling"
  resource_id            = aws_appautoscaling_target.ecs_service_scaling_target.resource_id
  scalable_dimension     = aws_appautoscaling_target.ecs_service_scaling_target.scalable_dimension
  service_namespace      = aws_appautoscaling_target.ecs_service_scaling_target.service_namespace
  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
    predefined_metric_type = var.ecs_scaling_metric
    }
    
    target_value          = var.ecs_scaling_target_value
    scale_out_cooldown    = var.ecs_scale_out_cooldown
    scale_in_cooldown     = var.ecs_scale_in_cooldown  
	}
}