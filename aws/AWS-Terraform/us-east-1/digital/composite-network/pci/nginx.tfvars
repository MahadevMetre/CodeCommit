//Launch Template Section
template_name = "nginx-digital-template-pci"
instance_type = "c4.xlarge"
key_name = "ec2-rhel-kp-pci"
template_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03032022"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "nginx-digital-template-pci"
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
	"CreatedOn" = "03032022"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "nginx-digital-instance-pci"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-08a9862a9edd0f91a", "sg-09baa00c0877dca46"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:601751840347:certificate/b36c7cfa-4cbe-47f9-84ac-358aa1616369"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "nginx-digital-ec2-scaling-pci"
vpc_zone_identifier   = ["subnet-0a797df6e7dcae3db", "subnet-0a33ed77fe2cfb6ef"]
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
		value               = "sbose"
		propagate_at_launch = false
	},
	{
		key                 = "created_date"
		value               = "03032022"
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
ami_name = "nginx-digital-pci-03062024"
source_instance_id = "i-0b1b40d95dee45f2a"
ami_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03062024"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03062024"
	"Name" = "nginx-digital-ami-pci"
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
lb_name								=	"nginx-dig-app-alb-pci"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "03032022"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "nginx-dig-app-alb-pci"
	"TechStack" = "Nginx"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0da12ca60c798233f", "subnet-05328035f3efef0ed"]
lb_security_groups					=	["sg-02f3e76503253189b", "sg-05a131ab376028789"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	false
lb_bucket_name						=	"franklin-alb-access-logs-pci"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"nginx-dig-app-tg-pci"
tg_health_check_port				=	443
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00bd4d2758879b1e0"
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
	"CreatedOn" = "03032022"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
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