cluster_name				= "demo_scheduled_dev"
cluster_tags = {
	"ApplicationName"		= "demo"
}

iam_role_name				= "demo_scheduledtask-ecs-task-execution-role-dev"

iam_role_tags = {
	"ApplicationName"		= "demo"
}

cloudwatch_log_group_name	= "/ecs/demo_scheduledtask_dev"
cloudwatch_log_group_retention = 30
cloudwatch_log_group_tags = {
	"ApplicationName"		= "demo"
}

task_definition_family		= "demo_scheduledtask-task-dev"
container_definition_name	= "demo_scheduledtask-container"
# container_definition_image	= "116762271881.dkr.ecr.us-east-1.amazonaws.com/fmg-insuranceapps:atlas-services-serverless-webservices-dev"
container_definition_image	= "nginx:latest"
cd_portmapping_containerport = 8080
cd_portmapping_hostport = 8080
cd_portmapping_protocol = "tcp"
cd_env_vars = [
	{
		"name"	=	"JWT_TOKEN_EXPIRY_MINS",
		"value"	=	"30"
	},
	{
		"name"	=	"LOG_LEVEL",
		"value"	=	"DEBUG"
	}
]
task_definition_cpu			= "256"
task_definition_memory		= "512"

td_tags = {
	"ApplicationName"		= "demo"
}

service_name				= "demo_scheduledtask-service-dev"
service_subnets				= ["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
service_sg					= ["sg-03ec84b14631c5168"]
# service_tg_arn				= "arn:aws:elasticloadbalancing:us-east-1:116762271881:targetgroup/fmg-atlas-serverless-tg-dev/77d26336c8df348a"