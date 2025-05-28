//Launch Template Section
template_name = "nginx-digital-template-qa"
instance_type = "t3.small"
key_name = "fmg-schrute-qa"
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
	"Name" = "nginx-digital-template-qa"
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
	"Name" = "nginx-digital-instance-qa"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-0afcfccd7af9709c3", "sg-02678040dcf57ae07"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:634621569833:certificate/2568d052-95fe-4946-9295-493d307d2b64"
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
start_schedule_start_time		= "2024-09-11T16:43:33Z"
start_schedule_recurrence		= "0 3 * * MON"

stop_schedule_name = "Stop-Schedule"
stop_schedule_desired_capacity	= 0
stop_schedule_minsize			= 0
stop_schedule_start_time		= "2026-05-01T00:00:00Z"
stop_schedule_recurrence		= "0 0 * * SAT"

//ASG
scaling_name = "nginx-digital-ec2-scaling-qa"
vpc_zone_identifier   = ["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
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
ami_name = "nginx-digital-qa-09242024"
source_instance_id = "i-0f917c2efdada01ba"
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
	"Name" = "EC2_nginx_instance_09242024"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Autoscaling notification
topic_arn = "arn:aws:sns:us-east-1:634621569833:autoscaling_topic_qa"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"nginx-alb-qa"
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
	"Name" = "nginx-alb-qa"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-059a28296ee46f82f", "subnet-0aeea9e95e8137ce8"]
lb_security_groups					=	["sg-0afcfccd7af9709c3", "sg-02678040dcf57ae07"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	false
lb_bucket_name						=	"franklin-alb-access-logs-qa"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"nginx-digital-app-tg-qa"
# tg_health_check_port				=	443
port                                =   443
tg_health_check_port				=   "traffic-port"
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00f27e42f4b836922"
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
zone_id = "Z103378821PH6AQBE9YBO"
route53_name = "qa-selfservice.fmservice.com"
route53_type = "A"
ttl = 300