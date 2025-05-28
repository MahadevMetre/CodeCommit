//Launch Template Section
template_name = "nginx-digital-blu-green-stage"
instance_type = "t3.small"
key_name = "Digital-Node2-Key"
template_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09052024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09052024"
	"Name" = "nginx-digital-blu-green-stage"
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
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09052024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09052024"
	"Name" = "nginx-digital-instance-blu-green-stage"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-09f3879b238abb26e", "sg-010670cd25f4a1a7c"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:702230634984:certificate/16578c99-0f7a-4921-9f21-d9ead6431d23"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
# start_stop_schedule = false
//ASG Schedule
start_stop_schedule = true
schedule_maxsize = 3

start_schedule_name = "Start-Schedule"
start_schedule_desired_capacity	= 1
start_schedule_minsize			= 1
start_schedule_start_time		= "2024-09-07T12:45:00Z"
start_schedule_recurrence		= "0 3 * * MON"

stop_schedule_name = "Stop-Schedule"
stop_schedule_desired_capacity	= 0
stop_schedule_minsize			= 0
stop_schedule_start_time		= "2026-05-01T00:00:00Z"
stop_schedule_recurrence		= "0 0 * * SAT"

//ASG
scaling_name = "nginx-digital-ec2-scaling-blu-green-stage"
vpc_zone_identifier   = ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
max_size = 4
min_size = 2
health_check_type = "ELB"
launch_configuration = null
termination_policies = ["NewestInstance", "OldestLaunchTemplate"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name                   = "nginx_autoscaling_policy"
target_value = 60
template_version = "$Latest"
autoscaling_tags = [{
		key                 = "terraform"
		value               = "true"
		propagate_at_launch = false
	},
	{
		key                 = "created_by"
		value               = "DevOps"
		propagate_at_launch = false
	},
	{
		key                 = "created_date"
		value               = "09052024"
		propagate_at_launch = false
	},
	{
		key                 = "project"
		value               = "digital"
		propagate_at_launch = false
	},
	{
		key                 = "purpose"
		value               = "Autoscaling Group for the nginx nodes"
		propagate_at_launch = false
	}
]
scaling_desired_capacity   = 2


##AMI Creation
ami_name = "EC2_nginx_instance_09052024"
source_instance_id = "i-06b62674d5ca09d15"
ami_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09052024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09052024"
	"Name" = "nginx_instance_09052024"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Autoscaling notification
topic_arn = "arn:aws:sns:us-east-1:702230634984:autoscaling_stage_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"nginx-alb-blu-green-stage"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09052024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09052024"
	"Name" = "nginx-alb-blu-green-stage"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
lb_security_groups					=	["sg-09f3879b238abb26e", "sg-010670cd25f4a1a7c"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	false
lb_bucket_name						=	"franklin-stage-alb-accesslogs"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"nginx-dig-app-tg-blu-green-stage"
# tg_health_check_port				=	443
port                                =   443
tg_health_check_port				=   "traffic-port"
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-0051d323df13c7db3"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	30
tg_unhealthy_threshold				=	2
tg_health_check_timeout				=	5
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"
tg_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09052024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "09052024"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Route53 Segment
create_route53_entry = false
zone_id = "dummy"
route53_name = "dummy"
route53_type = "dummy"
ttl = "dummy"