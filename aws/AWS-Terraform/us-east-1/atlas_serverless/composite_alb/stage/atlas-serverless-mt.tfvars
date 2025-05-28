alb_sg_name					= "fmg-atlas-serverless-sg-stage"
alb_sg_description			= "Security group to allow inbound to alb"
alb_sg_vpc_id				= "vpc-0051d323df13c7db3"
alb_sg_tags = {
        "Department": "ATS2"
		"LastUpdated": "07102024"
		"CostCenter": "FMG"
		"CreatedOn": "07092024"
		"DataClassification": "Low"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "1.0"
		"ApplicationName": "Atlas2.0"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "DevOps"
    }
alb_sg_ingress_rules = {
	"1" = {
		from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "HTTPS From Private Subnets Stage"
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
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "HTTP within private subnet"
	},
	"7" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "SSH within private subnet"
	},
	"8" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "TomCat port within private subnet"
	}

}

lb_name						= "fmg-atlas-serverless-alb-stage"
lb_type						= "application"
lb_tags = {
        "Department": "ATS2"
		"LastUpdated": "07102024"
		"CostCenter": "FMG"
		"CreatedOn": "07092024"
		"DataClassification": "Low"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "1.0"
		"ApplicationName": "Atlas2.0"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "DevOps"
    }
lb_subnets						= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
lb_enable_deletion_protection	= true
lb_internal_bool				= true
lb_bucket_name					= "franklin-stage-alb-accesslogs"
lb_idle_timeout					= 120

tg_name								= "fmg-atlas-serverless-tg-stage"
port								= 80				
tg_health_check_port				= "traffic-port"
tg_protocol							= "HTTP"
tg_vpc_id							= "vpc-0051d323df13c7db3"
tg_protocol_version					= "HTTP1"
tg_deregistration_delay				= 15
tg_healthy_threshold				= 5
tg_interval							= 30
tg_unhealthy_threshold				= 2
tg_health_check_timeout				= 5
tg_load_balancing_algorithm_type	= "least_outstanding_requests"
tg_health_check_protocol			= "HTTP"
tg_target_type						= "ip"
tg_health_check_path				= "/actuator/health"
tg_tags = {
        "Department": "ATS2"
		"LastUpdated": "07102024"
		"CostCenter": "FMG"
		"CreatedOn": "07092024"
		"DataClassification": "Low"
		"Infrastructure": "False"
		"Usage": "Project"
		"Version": "1.0"
		"ApplicationName": "Atlas2.0"
		"TechStack": "None"
		"Automated": "True"
		"BackupPlan": "None"
		"CreatedBy": "DevOps"
    }

lbl_certificate_arn					= "arn:aws:acm:us-east-1:702230634984:certificate/71873d94-7ac0-450e-a140-510283cdde64"
lbl_health_check_port				= 443
lbl_protocol						= "HTTPS"
lbl_default_action_type				= "forward"
lbl_ssl_policy						= "ELBSecurityPolicy-TLS13-1-2-2021-06"

route53_zone_id				= "Z010407314HT5G1PGDENW"
route53_name				= "stage-atlas-serverless-mt.franklinmadisonds.com"
route53_type				= "CNAME"