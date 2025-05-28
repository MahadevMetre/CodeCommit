alb_sg_name					= "fmg-forecast-sg-dev"
alb_sg_description			= "Security group to allow inbound to alb"
alb_sg_vpc_id				= "vpc-00ff8e33839358d28"
alb_sg_tags = {
    "ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08222024"
	"DataClassification"	= "Low"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08222024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
    }
alb_sg_ingress_rules = {
	"1" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.153.14.0/23"]
		description			= "HTTPS From Private Subnets Dev"
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
		cidr_blocks			= ["10.33.99.102/32"]
		description			= "HTTPS From Devlsys7"
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
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.153.14.0/23"]
		description			= "HTTP within private subnet"
	},
	"7" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.14.0/23"]
		description			= "SSH within private subnet"
	},
	"8" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.14.0/23"]
		description			= "TomCat port within private subnet"
	}
}

lb_name						= "fmg-forecast-alb-dev"
lb_type						= "application"
lb_tags = {
    "ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08222024"
	"DataClassification"	= "Low"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08222024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
    }
lb_subnets						= ["subnet-06291ceaa523f684c", "subnet-0734d8f28467d319f"]
lb_enable_deletion_protection	= true
lb_internal_bool				= true
lb_bucket_name					= "franklin-dev-alb-accesslogs"
lb_idle_timeout					= 120

tg_name								= "fmg-forecast-tg-dev"
port								= 80
tg_health_check_port				= "traffic-port"
tg_protocol							= "HTTP"
tg_vpc_id							= "vpc-00ff8e33839358d28"
tg_protocol_version					= "HTTP1"
tg_deregistration_delay				= 15
tg_healthy_threshold				= 5
tg_interval							= 30
tg_unhealthy_threshold				= 2
tg_health_check_timeout				= 5
tg_load_balancing_algorithm_type	= "least_outstanding_requests"
tg_health_check_protocol			= "HTTP"
tg_target_type						= "ip"
tg_health_check_path				= "/forecast-ws/healthCheck/test"
tg_tags = {
    "ApplicationName"		= "InsuranceApps"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08222024"
	"DataClassification"	= "Low"
	"Department"			= "IAPPS"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08222024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
    }

lbl_certificate_arn					= "arn:aws:acm:us-east-1:116762271881:certificate/76b21c0c-3066-44bb-9c52-ef67922e488a"
lbl_health_check_port				= 443
lbl_protocol						= "HTTPS"
lbl_default_action_type				= "forward"
lbl_ssl_policy						= "ELBSecurityPolicy-TLS13-1-2-2021-06"

route53_zone_id				= "Z04314328KDEDCB3P6MU"
route53_name				= "dev-forecast-mt.franklinmadisonds.com"
route53_type				= "CNAME"