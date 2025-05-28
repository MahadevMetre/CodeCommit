//Launch Template Section
template_name = "nginx-insuranceapps-template-dr"
instance_type = "c4.xlarge"
key_name = "ec2-iapps-dr"
template_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "03112024"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "nginx-insuranceapps-template-dr"
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
	"CreatedBy" = "Charles"
	"CreatedOn" = "02152024"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "02152024"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "nginx-insuranceapps-instance-dr"
				}
lt_security_groups = ["sg-0b2ec3597bb29a2ef","sg-0e63438527d27bf3c"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-west-2:214946096060:certificate/dace224a-be80-4886-a560-227c4fdf2ab0"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "nginx-insuranceapps-ec2-scaling-dr"
vpc_zone_identifier   = ["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
max_size = 4
min_size = 1
health_check_type = "ELB"
launch_configuration = null
termination_policies = ["NewestInstance","OldestLaunchTemplate"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name                   = "nginx-insuranceapps-ec2-scaling-policy"
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
		value               = "16012023"
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
scaling_desired_capacity   = 0


##AMI Creation
ami_name = "nginx-insuranceapps-dr-03112024"
source_instance_id = "i-022398ad90ae873eb"
ami_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "Karthik"
	"CreatedOn" = "01232024"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "03112024"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "nginx-insuranceapps-ami-dr"
				}

#Autoscaling notification
topic_arn = "arn:aws:sns:us-west-2:214946096060:autoscaling_dr_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"nginx-iapps-app-alb-dr"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "01162023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "nginx-iapps-app-alb-dr"
									}
lb_subnets							=	["subnet-0b927d24fec28d40b","subnet-0a1d3486597f552fe"]
lb_security_groups					=	["sg-0b2ec3597bb29a2ef"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-dr"

// target_group values
tg_name								=	"nginx-insuranceapps-tg-dr"
tg_health_check_port				=	443
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-0e79e26eb537504d0"
tg_protocol_version					=	"HTTP2"
tg_healthy_threshold				=	5
tg_interval							=	30
tg_unhealthy_threshold				=	2
tg_health_check_timeout				=	5
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"

#Route53 Segment
zone_id = "Z00624956N47Z2N3AN6I"
route53_name = "dr.insuranceapps.franklinmadisonds.com"
route53_type = "A"
ttl = 300