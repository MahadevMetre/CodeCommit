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

resource "aws_cloudwatch_log_group" "log-group2" {
	name = var.cloudwatch_log_group_name2
	retention_in_days = var.cloudwatch_log_group_retention2
	tags = var.cloudwatch_log_group_tags2
}

resource "aws_cloudwatch_log_group" "log-group3" {
	name = var.cloudwatch_log_group_name3
	retention_in_days = var.cloudwatch_log_group_retention3
	tags = var.cloudwatch_log_group_tags3
}

resource "aws_cloudwatch_log_group" "log-group4" {
	name = var.cloudwatch_log_group_name4
	retention_in_days = var.cloudwatch_log_group_retention4
	tags = var.cloudwatch_log_group_tags4
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


resource "aws_ecs_task_definition" "my_ecs_task_definition2" {
	family = "${var.task_definition_family2}"

	container_definitions = jsonencode([{
		name = var.container_definition_name2
		image = var.container_definition_image2
		essential = true

		logConfiguration = {
			logDriver = "awslogs"
			options = {
				awslogs-group = aws_cloudwatch_log_group.log-group2.id
				awslogs-region = "us-east-1"
				awslogs-stream-prefix = "ecs"
			}
		}

		cpu = 0

		volumesFrom = []

		portMappings = [
		{
			containerPort = var.cd_portmapping_containerport2
			hostPort = var.cd_portmapping_hostport2
			protocol = var.cd_portmapping_protocol2
		}
		]

		environment = var.cd_env_vars2

		mountPoints = var.cd_mount_points2

		networkMode = "awsvpc"
	}])

	requires_compatibilities	= ["EC2", "FARGATE"]
	network_mode				= "awsvpc"
	cpu							= var.task_definition_cpu2
	memory						= var.task_definition_memory2
	execution_role_arn			= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_execution_role_arn2
	task_role_arn				= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_task_role_arn2

	runtime_platform {
		operating_system_family = "LINUX"
		cpu_architecture        = "X86_64"
	}

	dynamic "volume" {
		for_each = var.td_volumes2
		content {
			name = volume.value.td_volume_name
			efs_volume_configuration {
				file_system_id = volume.value.td_volume_fs_id
				root_directory = volume.value.td_volume_root_dir
			}
		}
	}

	tags = var.td_tags2
}



resource "aws_ecs_task_definition" "my_ecs_task_definition3" {
	family = "${var.task_definition_family3}"

	container_definitions = jsonencode([{
		name = var.container_definition_name3
		image = var.container_definition_image3
		essential = true

		logConfiguration = {
			logDriver = "awslogs"
			options = {
				awslogs-group = aws_cloudwatch_log_group.log-group3.id
				awslogs-region = "us-east-1"
				awslogs-stream-prefix = "ecs"
			}
		}

		cpu = 0

		volumesFrom = []

		portMappings = [
		{
			containerPort = var.cd_portmapping_containerport3
			hostPort = var.cd_portmapping_hostport3
			protocol = var.cd_portmapping_protocol3
		}
		]

		environment = var.cd_env_vars3

		mountPoints = var.cd_mount_points3

		networkMode = "awsvpc"
	}])

	requires_compatibilities	= ["EC2", "FARGATE"]
	network_mode				= "awsvpc"
	cpu							= var.task_definition_cpu3
	memory						= var.task_definition_memory3
	execution_role_arn			= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_execution_role_arn3
	task_role_arn				= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_task_role_arn3

	runtime_platform {
		operating_system_family = "LINUX"
		cpu_architecture        = "X86_64"
	}

	dynamic "volume" {
		for_each = var.td_volumes3
		content {
			name = volume.value.td_volume_name
			efs_volume_configuration {
				file_system_id = volume.value.td_volume_fs_id
				root_directory = volume.value.td_volume_root_dir
			}
		}
	}

	tags = var.td_tags3
}



resource "aws_ecs_task_definition" "my_ecs_task_definition4" {
	family = "${var.task_definition_family4}"

	container_definitions = jsonencode([{
		name = var.container_definition_name4
		image = var.container_definition_image4
		essential = true

		logConfiguration = {
			logDriver = "awslogs"
			options = {
				awslogs-group = aws_cloudwatch_log_group.log-group4.id
				awslogs-region = "us-east-1"
				awslogs-stream-prefix = "ecs"
			}
		}

		cpu = 0

		volumesFrom = []

		portMappings = [
		{
			containerPort = var.cd_portmapping_containerport4
			hostPort = var.cd_portmapping_hostport4
			protocol = var.cd_portmapping_protocol4
		}
		]

		environment = var.cd_env_vars4

		mountPoints = var.cd_mount_points4

		networkMode = "awsvpc"
	}])

	requires_compatibilities	= ["EC2", "FARGATE"]
	network_mode				= "awsvpc"
	cpu							= var.task_definition_cpu4
	memory						= var.task_definition_memory4
	execution_role_arn			= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_execution_role_arn4
	task_role_arn				= length(aws_iam_role.ecsTaskExecutionRole) > 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : var.td_task_role_arn4

	runtime_platform {
		operating_system_family = "LINUX"
		cpu_architecture        = "X86_64"
	}

	dynamic "volume" {
		for_each = var.td_volumes4
		content {
			name = volume.value.td_volume_name
			efs_volume_configuration {
				file_system_id = volume.value.td_volume_fs_id
				root_directory = volume.value.td_volume_root_dir
			}
		}
	}

	tags = var.td_tags4
}





data "aws_ecs_task_definition" "my_ecs_task_definition_data" {
	task_definition = aws_ecs_task_definition.my_ecs_task_definition.family
}

data "aws_ecs_task_definition" "my_ecs_task_definition_data2" {
	task_definition = aws_ecs_task_definition.my_ecs_task_definition2.family
}

data "aws_ecs_task_definition" "my_ecs_task_definition_data3" {
	task_definition = aws_ecs_task_definition.my_ecs_task_definition3.family
}

data "aws_ecs_task_definition" "my_ecs_task_definition_data4" {
	task_definition = aws_ecs_task_definition.my_ecs_task_definition4.family
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
	lifecycle {
		ignore_changes = [desired_count]
	}
}

resource "aws_ecs_service" "my_ecs_service3" {
	name                 = var.service_name3
	cluster              = aws_ecs_cluster.my_cluster.id
	task_definition      = "${aws_ecs_task_definition.my_ecs_task_definition3.family}:${max(aws_ecs_task_definition.my_ecs_task_definition3.revision, data.aws_ecs_task_definition.my_ecs_task_definition_data3.revision)}"
	launch_type          = "FARGATE"
	scheduling_strategy  = "REPLICA"
	desired_count        = 0
	force_new_deployment = true

	network_configuration {
		subnets				= var.service_subnets3
		assign_public_ip	= false
		security_groups		= var.service_sg3
	}

	load_balancer {
		target_group_arn	= var.service_tg_arn3
		container_name		= var.container_definition_name3
		container_port		= var.cd_portmapping_containerport3
	}
	# The following block is added to ignore the service count changes which are made manually.
	# Comment out in case we need to update the desired_count via terraform
	lifecycle {
		ignore_changes = [desired_count]
	}
}

resource "aws_ecs_service" "my_ecs_service2" {
	name                 = var.service_name2
	cluster              = aws_ecs_cluster.my_cluster.id
	task_definition      = "${aws_ecs_task_definition.my_ecs_task_definition2.family}:${max(aws_ecs_task_definition.my_ecs_task_definition2.revision, data.aws_ecs_task_definition.my_ecs_task_definition_data2.revision)}"
	launch_type          = "FARGATE"
	scheduling_strategy  = "REPLICA"
	desired_count        = 0
	force_new_deployment = true

	network_configuration {
		subnets				= var.service_subnets2
		assign_public_ip	= false
		security_groups		= var.service_sg2
	}

	load_balancer {
		target_group_arn	= var.service_tg_arn2
		container_name		= var.container_definition_name2
		container_port		= var.cd_portmapping_containerport2
	}
	# The following block is added to ignore the service count changes which are made manually.
	# Comment out in case we need to update the desired_count via terraform
	lifecycle {
		ignore_changes = [desired_count]
	}
}

resource "aws_ecs_service" "my_ecs_service4" {
	name                 = var.service_name4
	cluster              = aws_ecs_cluster.my_cluster.id
	task_definition      = "${aws_ecs_task_definition.my_ecs_task_definition4.family}:${max(aws_ecs_task_definition.my_ecs_task_definition4.revision, data.aws_ecs_task_definition.my_ecs_task_definition_data4.revision)}"
	launch_type          = "FARGATE"
	scheduling_strategy  = "REPLICA"
	desired_count        = 0
	force_new_deployment = true

	network_configuration {
		subnets				= var.service_subnets4
		assign_public_ip	= false
		security_groups		= var.service_sg4
	}

	load_balancer {
		target_group_arn	= var.service_tg_arn4
		container_name		= var.container_definition_name4
		container_port		= var.cd_portmapping_containerport4
	}
	# The following block is added to ignore the service count changes which are made manually.
	# Comment out in case we need to update the desired_count via terraform
	lifecycle {
		ignore_changes = [desired_count]
	}
}
