alb_sg_name					= "fmg-ecs-sg-alb-prod"
alb_sg_description			= "Security group to allow inbound to alb"
alb_sg_vpc_id				= "vpc-021b1f680addbd6db"
alb_sg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "03072024"
	"Name"					= "fmg-ecs-sg-alb-prod"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
alb_sg_ingress_rules = {
	"1" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.153.2.0/23"]
		description			= "HTTPS From Private Subnets Prod"
	},
	"2" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "HTTPS From Palo VPN"
	},
	"3" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.33.98.128/32"]
		description			= "HTTPS From Prodsys7"
	},
	"4" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["202.168.90.114/32"]
		description			= "HTTPS From Virtusa Navalur Tunnel"
	},
	"5" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["203.62.174.143/32"]
		description			= "HTTPS From Virtusa Navalur Tunnel"
	},
	"6" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "HTTPS From Private Subnets PCI"
	}
}

lb_name						= "fmg-serverless-alb-prod"
lb_type						= "application"
lb_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11292023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
lb_subnets						= ["subnet-0052ab706c1f947c9", "subnet-011ed7a9e6d735228"]
lb_enable_deletion_protection	= true
lb_internal_bool				= true
lb_bucket_name					= "franklin-alb-access-logs-prod"
lb_idle_timeout					= 120

tg_name								= "fmg-serverless-tg-prod"
tg_health_check_port				= 8080
tg_protocol							= "HTTP"
tg_vpc_id							= "vpc-021b1f680addbd6db"
tg_protocol_version					= "HTTP1"
tg_deregistration_delay				= 300
tg_healthy_threshold				= 5
tg_interval							= 30
tg_unhealthy_threshold				= 2
tg_health_check_timeout				= 5
tg_load_balancing_algorithm_type	= "least_outstanding_requests"
tg_health_check_protocol			= "HTTP"
tg_target_type						= "ip"
tg_health_check_path				= "/actuator/health"
tg_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08182023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08182023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

tg2_name							= "pycharm-webservices-tg-prod"
tg2_health_check_port				= 80
tg2_protocol						= "HTTP"
tg2_vpc_id							= "vpc-021b1f680addbd6db"
tg2_protocol_version				= "HTTP1"
tg2_deregistration_delay			= 300
tg2_healthy_threshold				= 5
tg2_interval						= 30
tg2_unhealthy_threshold				= 2
tg2_health_check_timeout			= 5
tg2_load_balancing_algorithm_type	= "least_outstanding_requests"
tg2_health_check_protocol			= "HTTP"
tg2_target_type						= "ip"
tg2_health_check_path				= "/"
tg2_success_codes					= "200"
tg2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11082023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11082023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

tg3_name							= "fmg-serverless-email-tg-prod"
tg3_health_check_port				= 8080
tg3_protocol						= "HTTP"
tg3_vpc_id							= "vpc-021b1f680addbd6db"
tg3_protocol_version				= "HTTP1"
tg3_deregistration_delay			= 300
tg3_healthy_threshold				= 5
tg3_interval						= 30
tg3_unhealthy_threshold				= 2
tg3_health_check_timeout			= 5
tg3_load_balancing_algorithm_type	= "least_outstanding_requests"
tg3_health_check_protocol			= "HTTP"
tg3_target_type						= "ip"
tg3_health_check_path				= "/actuator/health"
tg3_success_codes					= "200"
tg3_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11292023"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

lbr_priority		= 1
lbr_action_type		= "forward"
lbr_path_pattern	= ["/pycharm/*"]
lbr_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09272023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09272023"
	"Name"					= "PyCharm Rule"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

lbr2_priority		= 2
lbr2_action_type	= "forward"
lbr2_path_pattern	= ["/emailintegration/*"]
lbr2_tags = {
	"ApplicationName"		= "Hermes2.0"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "Operations"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "11292023"
	"DataClassification"	= "None"
	"Department"			= "HMS2"
	"Infrastructure"		= "False"
	"LastUpdated"			= "11292023"
	"Name"					= "Email Integration Rule"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

lbl_certificate_arn					= "arn:aws:acm:us-east-1:361469336240:certificate/bc9388ab-1528-4eea-b5ff-9f229957606c"
lbl_health_check_port				= 443
lbl_protocol						= "HTTPS"
lbl_default_action_type				= "forward"
lbl_ssl_policy						= "ELBSecurityPolicy-TLS13-1-2-2021-06"

route53_zone_id				= "Z040422214IY8G116DBES"
route53_name				= "ecs.mtservices.franklinmadisonds.com"
route53_type				= "CNAME"