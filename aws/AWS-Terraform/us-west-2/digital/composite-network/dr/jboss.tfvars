//Launch Template Section
template_name = "jboss-slave-digital-template-dr"
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
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "jboss-slave-digital-template-dr"
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
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "jboss-slave-digital-instance-dr"
				}
lt_security_groups = ["sg-0e65fd3db25a785e9","sg-00737bee850e3a634"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-west-2:214946096060:certificate/fd52348d-b535-4d96-aa18-cc0eac832ab0"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "jboss-digital-ec2-scaling-dr"
vpc_zone_identifier   = ["subnet-0b927d24fec28d40b", 
	"subnet-0a1d3486597f552fe"]  
max_size = 4
min_size = 2
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
policy_name                   = "jboss-slave-digital-ec2-scaling-policy"
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
		value               = "Autoscaling Group for the Jboss slave nodes"
		propagate_at_launch = false
	}
]
scaling_desired_capacity   = 2


##AMI Creation
ami_name = "jboss-slave-digital-dr-01232024-patch"
source_instance_id = "i-0a0563a93ba2e35be"
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
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "jboss-slave-digital-ami-dr"
				}
#Autoscaling notification
topic_arn = "arn:aws:sns:us-west-2:214946096060:autoscaling_dr_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"jboss-digital-alb-dr"
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
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "jboss-digital-alb-dr"
									}
lb_subnets							=	["subnet-0b927d24fec28d40b", 
	"subnet-0a1d3486597f552fe"]
lb_security_groups					=	["sg-00737bee850e3a634"] 
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-dr"

// target_group values
tg_name								=	"jboss-digital-tg-dr"
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
zone_id = "Z08821313P6ZL67HTO4WM"
route53_name = "dr.mtservicesapps.fmservice.com"
route53_type = "A"
ttl = 300