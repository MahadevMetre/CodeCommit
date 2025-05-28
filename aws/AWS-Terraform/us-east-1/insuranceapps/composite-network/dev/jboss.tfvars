//Launch Template Section
template_name = "jboss-slave-insuranceapps-template-dev"
instance_type = "c6i.large"
key_name = "EC2-Dev-key"
template_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09282021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07232023"
	"Name" = "jboss-slave-insuranceapps-template-dev"
	"TechStack" = "JBoss"
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
	"CreatedOn" = "09282021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07232023"
	"Name" = "jboss-slave-insuranceapps-instance-dev"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-01485bd2c4af40ae6", "sg-055fcd6e5bb9d467e"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:116762271881:certificate/7890d85d-e497-4a81-969e-f0396366a777"
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
scaling_name = "jboss-insuranceapps-ec2-scaling-dev"
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
policy_name                   = "jboss-slave-insuranceapps-ec2-scaling-policy"
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
		value               = "09282021"
		propagate_at_launch = false
	},
	{
		key                 = "project"
		value               = "insuranceapps"
		propagate_at_launch = false
	},
	{
		key                 = "purpose"
		value               = "Autoscaling Group for the Jboss slave nodes"
		propagate_at_launch = false
	}
]
scaling_desired_capacity   = 1


##AMI Creation
ami_name = "jboss-slave-insuranceapps-dev-10102023"
source_instance_id = "i-0fb0e3f3991d79e76"
ami_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "10092023"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "10102023"
	"Name" = "jboss-slave-insuranceapps-ami-dev"
	"TechStack" = "JBoss"
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
lb_name								=	"jboss-insuranceapps-alb-dev"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09282021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07232023"
	"Name" = "jboss-insuranceapps-alb-dev"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0734d8f28467d319f", "subnet-06291ceaa523f684c"]
lb_security_groups					=	["sg-01485bd2c4af40ae6"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-dev-alb-accesslogs"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"jboss-insuranceapps-tg-dev"
tg_health_check_port				=	9993
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00ff8e33839358d28"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	120
tg_unhealthy_threshold				=	5
tg_health_check_timeout				=	30
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"
tg_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09282021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Route53 Segment
zone_id = "Z04314328KDEDCB3P6MU"
route53_name = "dev.mtservicesapps.franklinmadisonds.com"
route53_type = "A"
ttl = 300