//Launch Template Section
template_name = "nginx-digital-template-dr"
instance_type = "c4.xlarge"
key_name = "ec2-digital-dr"
template_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "nginx-digital-template-dr"
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
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "nginx-digital-instance-dr"
				}
lt_security_groups = ["sg-0e65fd3db25a785e9","sg-0ea5462690f67c4cf"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-west-2:214946096060:certificate/068c849c-171a-43e2-8850-e4897f1a87d3"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "nginx-digital-ec2-scaling-dr"
vpc_zone_identifier   = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
max_size = 4
min_size = 2
health_check_type = "ELB"
launch_configuration = null
termination_policies = ["NewestInstance","OldestLaunchTemplate"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name                   = "nginx-digital-ec2-scaling-policy"
target_value = 60
template_version = "$Latest"
autoscaling_tags = [{
		key                 = "terraform"
		value               = "true"
		propagate_at_launch = false
	},
	{
		key                 = "created_by"
		value               = "mfaizudeen"
		propagate_at_launch = false
	},
	{
		key                 = "created_date"
		value               = "03182023"
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
ami_name = "nginx-digital-dr-01232024-patch"
source_instance_id = "i-0130539cfe629fec5"
ami_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "Karthik"
	"CreatedOn" = "01232024"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "01232024"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "nginx-digital-ami-dr"
				}
#Autoscaling notification
topic_arn = "arn:aws:sns:us-west-2:214946096060:autoscaling_dr_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"nginx-dig-app-alb-dr"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "nginx-dig-app-alb-dr"
									}
lb_subnets							=	["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
lb_security_groups					=	["sg-0ea5462690f67c4cf"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	false
lb_bucket_name						=	"franklin-alb-access-logs-dr"

// target_group values
tg_name								=	"nginx-dig-app-tg-dr"
tg_health_check_port				=	443
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-0e79e26eb537504d0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	30
tg_unhealthy_threshold				=	2
tg_health_check_timeout				=	5
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"

#Route53 Segment
create_route53_entry = false
zone_id = "dummy"
route53_name = "dummy"
route53_type = "dummy"
ttl = "dummy"