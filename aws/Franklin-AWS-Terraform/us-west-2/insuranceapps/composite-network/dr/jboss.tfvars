//Launch Template Section
template_name = "jboss-slave-insuranceapps-template-dr"
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
	"LastUpdated" = "01162023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "jboss-slave-insuranceapps-template-dr"
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
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "01162023"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "01162023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "jboss-slave-insuranceapps-instance-dr"
				}
lt_security_groups = ["sg-06d07d051799aab60","sg-0e63438527d27bf3c"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-west-2:214946096060:certificate/1c62a725-3aa3-4816-9701-f97e1b1d369d"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "jboss-insuranceapps-ec2-scaling-dr"
vpc_zone_identifier   = ["subnet-0b927d24fec28d40b", 
	"subnet-0a1d3486597f552fe"]  
max_size = 4
min_size = 1
health_check_type = "ELB"
launch_configuration = null
termination_policies = ["NewestInstance",
	"OldestLaunchTemplate"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name                   = "jboss-slave-insuranceapps-ec2-scaling-policy"
target_value = 40
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
		value               = "Autoscaling Group for the Jboss slave nodes"
		propagate_at_launch = false
	}
]
scaling_desired_capacity   = 0


##AMI Creation
ami_name = "jboss-slave-insuranceapps-dr-01232024-patch-ssh"
source_instance_id = "i-0b1ecf021f142456f"
ami_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "karthik"
	"CreatedOn" = "01232024"
	"DataClassification" = "Low"
	"Department" = "IAP"
	"Infrastructure" = "False"
	"LastUpdated" = "01232024"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	=	"jboss-slave-insuranceapps-ami-dr"
				}

#Autoscaling notification
topic_arn = "arn:aws:sns:us-west-2:214946096060:autoscaling_dr_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"jboss-iapps-alb-dr"
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
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "jboss-iapps-alb-dr"
								}
lb_subnets							=	["subnet-0b927d24fec28d40b", 
	"subnet-0a1d3486597f552fe"]
lb_security_groups					=	["sg-06d07d051799aab60"] 
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-dr"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"jboss-insuranceapps-tg-dr"
tg_health_check_port				=	9993
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-0e79e26eb537504d0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	120
tg_unhealthy_threshold				=	5
tg_health_check_timeout				=	30
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"

#Route53 Segment
zone_id = "Z00624956N47Z2N3AN6I"
route53_name = "dr.mtservicesapps.franklinmadisonds.com"
route53_type = "A"
ttl = 300