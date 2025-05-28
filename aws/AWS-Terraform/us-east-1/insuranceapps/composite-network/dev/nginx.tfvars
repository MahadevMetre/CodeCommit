//Launch Template Section
template_name = "nginx-insuranceapps-template-dev"
instance_type = "t3.small"
key_name = "EC2-Dev-key"
template_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09082021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07232023"
	"Name" = "nginx-insuranceapps-template-dev"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
associate_public_ip_address = false
update_default_version = true
#ebs_optimized = true
#device_name = "/dev/sdf"
#ebs_volume = 30
#ebs_delete = true
#ebs_encrypted = true
#ebs_volume_type = "gp2"
launch_template_monitoring = true
resource_type = "instance"
resource_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09082021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07232023"
	"Name" = "nginx-insuranceapps-instance-dev"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-098b5393346ba5693"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:116762271881:certificate/77e2cc81-9b47-475a-abde-b664bf16d8a9"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = true
schedule_maxsize = 2

start_schedule_name = "Start-Schedule"
start_schedule_desired_capacity	= 1
start_schedule_minsize			= 1
start_schedule_start_time		= "2023-01-23T03:00:00Z"
start_schedule_recurrence		= "0 3 * * MON"

stop_schedule_name = "Stop-Schedule"
stop_schedule_desired_capacity	= 0
stop_schedule_minsize			= 0
stop_schedule_start_time		= "2023-01-28T00:00:00Z"
stop_schedule_recurrence		= "0 0 * * SAT"

//ASG
scaling_name = "nginx-insuranceapps-ec2-scaling-dev"
vpc_zone_identifier   = ["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
max_size = 2
min_size = 1
health_check_type = "ELB"
launch_configuration = null
termination_policies = ["NewestInstance", "OldestLaunchTemplate"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name                   = "nginx-insuranceapps-ec2-scaling-policy"
target_value = 75
template_version = "$Latest"
autoscaling_tags = [{
		key                 = "terraform"
		value               = "true"
		propagate_at_launch = false
	},
	{
		key                 = "created_by"
		value               = "jsamuel"
		propagate_at_launch = false
	},
	{
		key                 = "created_date"
		value               = "09082021"
		propagate_at_launch = false
	},
	{
		key                 = "project"
		value               = "insuranceapps"
		propagate_at_launch = false
	},
	{
		key                 = "purpose"
		value               = "Autoscaling Group for the nginx nodes"
		propagate_at_launch = false
	}
]
scaling_desired_capacity   = 1


##AMI Creation
ami_name = "nginx-insuranceapps-dev-03022024"
source_instance_id = "i-04cbc2f709250c894"
ami_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03022024"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "03022024"
	"Name" = "nginx-insuranceapps-ami-dev"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Autoscaling notification
topic_arn = "arn:aws:sns:us-east-1:116762271881:autoscaling_dev_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"nginx-insuranceapps-app-alb-dev"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09082021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07232023"
	"Name" = "nginx-insuranceapps-app-alb-dev"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
lb_security_groups					=	["sg-098b5393346ba5693"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-dev-alb-accesslogs"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"nginx-insuranceapps-tg-dev"
tg_health_check_port				=	443
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00ff8e33839358d28"
tg_protocol_version					=	"HTTP2"
tg_healthy_threshold				=	5
tg_interval							=	30
tg_unhealthy_threshold				=	2
tg_health_check_timeout				=	5
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"
tg_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09082021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Route53 Segment
zone_id = "Z04314328KDEDCB3P6MU"
route53_name = "dev.insuranceapps.franklinmadisonds.com"
route53_type = "A"
ttl = 300