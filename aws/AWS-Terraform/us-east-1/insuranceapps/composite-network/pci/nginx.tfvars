//Launch Template Section
template_name = "nginx-insuranceapps-template-pci"
instance_type = "c4.xlarge"
key_name = "ec2-rhel-kp-pci"
template_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09082021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "nginx-insuranceapps-template-pci"
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
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "nginx-insuranceapps-instance-pci"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-0b2933053f5bdc7fc", "sg-05ea83d9356fa9299"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:601751840347:certificate/263da6a5-8c34-45e4-affb-0a340bda1c3b"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "nginx-insuranceapps-ec2-scaling-pci"
vpc_zone_identifier   = ["subnet-0a797df6e7dcae3db", "subnet-0a33ed77fe2cfb6ef"]
max_size = 4
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
target_value = 60
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
ami_name = "nginx-insuranceapps-pci-05092024-terrapin-patch"
source_instance_id = "i-07567132b0c638a90"
ami_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03062024"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "03062024"
	"Name" = "nginx-insuranceapps-ami-pci"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Autoscaling notification
topic_arn = "arn:aws:sns:us-east-1:601751840347:autoscaling_pci_topic"
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]

// loadbalancer values
lb_name								=	"nginx-iapps-app-alb-pci"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "09082021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "03062024"
	"Name" = "nginx-iapps-app-alb-pci"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0a797df6e7dcae3db", "subnet-0a33ed77fe2cfb6ef"]
lb_security_groups					=	["sg-0b2933053f5bdc7fc"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-pci"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"nginx-insuranceapps-tg-pci"
tg_health_check_port				=	443
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00bd4d2758879b1e0"
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
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Route53 Segment
zone_id = "Z00268511A8F11AO13DEY"
route53_name = "insuranceapps.franklinmadisonds.com"
route53_type = "A"
ttl = 300