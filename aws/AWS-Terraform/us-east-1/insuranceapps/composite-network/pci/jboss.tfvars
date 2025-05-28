//Launch Template Section
template_name = "jboss-slave-insuranceapps-template-pci"
instance_type = "c4.xlarge"
key_name = "ec2-rhel-kp-pci"
template_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "10082021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "jboss-slave-insuranceapps-template-pci"
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
	"CreatedOn" = "10082021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "jboss-slave-insuranceapps-instance-pci"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lt_security_groups = ["sg-072411ca057169952", "sg-05ea83d9356fa9299"]

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:601751840347:certificate/a1c1221a-462f-45d9-8532-6317809e1dff"
lbl_health_check_port				=	443
lbl_protocol						=	"HTTPS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

//ASG Schedule
start_stop_schedule = false

//ASG
scaling_name = "jboss-insuranceapps-ec2-scaling-pci"
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
		value               = "jsamuel"
		propagate_at_launch = false
	},
	{
		key                 = "created_date"
		value               = "10082021"
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
ami_name = "jboss-slave-insuranceapps-pci-05092024-terrapin-patch"
source_instance_id = "i-0b21f6c2a6ea31b89"
ami_tags = {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "01212024"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "01212024"
	"Name" = "jboss-slave-insuranceapps-ami-pci"
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
lb_name								=	"jboss-iapps-alb-pci"
lb_type								=	"application"
lb_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "10082021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"Name" = "jboss-insuranceapps-alb-pci"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}
lb_subnets							=	["subnet-0a797df6e7dcae3db", "subnet-0a33ed77fe2cfb6ef"]
lb_security_groups					=	["sg-072411ca057169952"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-pci"
lb_idle_timeout						=	60

// target_group values
tg_name								=	"jboss-insuranceapps-tg-pci"
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
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "10082021"
	"DataClassification" = "PCI"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "07202023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#Route53 Segment
zone_id = "Z00268511A8F11AO13DEY"
route53_name = "mtservicesapps.franklinmadisonds.com"
route53_type = "A"
ttl = 300