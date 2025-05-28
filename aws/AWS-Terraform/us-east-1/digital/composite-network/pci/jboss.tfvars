//Launch Template Section
template_name = "jboss-slave-digital-template-pci"
instance_type = "c4.xlarge"
key_name = "ec2-rhel-kp-pci"
template_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "12302021"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "jboss-slave-digital-template-pci"
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
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "12302021"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "jboss-slave-digital-instance-pci"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-0a0103659b308d78b", "sg-08a9862a9edd0f91a"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:601751840347:certificate/a3163278-7b21-4b95-aa28-6666aa18ec6c"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "jboss-digital-ec2-scaling-pci"
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
		value               = "sbose"
		propagate_at_launch = false
	},
	{
		key                 = "created_date"
		value               = "12302021"
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
ami_name = "jboss-slave-digital-pci-05092024-terrapin-patch"
source_instance_id = "i-00d0dee3da239807a"
ami_tags = {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "05092024"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "05092024"
	"Name" = "jboss-slave-digital-ami-pci"
	"TechStack" = "JBoss"
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
lb_name								=	"jboss-digital-alb-pci"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "12302021"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0a797df6e7dcae3db", "subnet-0a33ed77fe2cfb6ef"]
lb_security_groups					=	["sg-0a0103659b308d78b", "sg-0f4493af34ac18357"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-pci"

// target_group values
tg_name								=	"jboss-digital-tg-pci"
tg_health_check_port				=	9993
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00bd4d2758879b1e0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	120
tg_unhealthy_threshold				=	5
tg_health_check_timeout				=	30
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"
tg_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "12302021"
	"DataClassification" = "PCI"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Route53 Segment
zone_id = "Z07293671OO698DPMPXYK"
route53_name = "mtservicesapps.fmservice.com"
route53_type = "A"
ttl = 300