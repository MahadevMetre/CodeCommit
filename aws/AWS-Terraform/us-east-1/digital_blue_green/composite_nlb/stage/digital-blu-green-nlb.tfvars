alb_sg_name					= "fmg-digital-blu-green-sg-stage"
alb_sg_description			= "Security group to allow inbound to alb"
alb_sg_vpc_id				= "vpc-0051d323df13c7db3"
alb_sg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09052024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09052024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
alb_sg_ingress_rules = {
	"1" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "HTTP within private subnet"
	},
	"2" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "SSH within private subnet"
	},
	"3" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.18.0/23"]
		description			= "TomCat port within private subnet"
	}
}

lb_name						= "fmg-digital-nlb-blu-green-stage"
lb_type						= "network"
lb_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09052024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09052024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
lb_subnets						= ["subnet-0ed61b6beb807094e", "subnet-076a071fa0723c80e"]
lb_enable_deletion_protection	= true
lb_internal_bool				= true
lb_bucket_name					= "franklin-stage-alb-accesslogs"
lb_idle_timeout					= 120

tg_name								= "fmg-digital-blu-green-tg-stage"
tg_health_check_port				= "traffic-port"
port								= 8080
tg_protocol							= "TCP"
tg_vpc_id							= "vpc-0051d323df13c7db3"
tg_deregistration_delay				= 15
tg_healthy_threshold				= 5
tg_interval							= 30
tg_unhealthy_threshold				= 2
tg_health_check_timeout				= 5
tg_health_check_protocol			= "HTTP"
tg_target_type						= "ip"
tg_health_check_path				= "/actuator/health"
tg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "09052024"
	"DataClassification"	= "Low"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "09052024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

lbl_health_check_port				= 80
lbl_protocol						= "TCP"
lbl_default_action_type				= "forward"
