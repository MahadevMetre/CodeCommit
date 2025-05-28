alb_sg_name					= "fmg-digital-serverless-sg-pci"
alb_sg_description			= "Security group to allow inbound to NLB"
alb_sg_vpc_id				= "vpc-00bd4d2758879b1e0"
alb_sg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08012024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08032024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
alb_sg_ingress_rules = {
	"1" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "HTTP within private subnet"
	},
	"2" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "SSH within private subnet"
	},
	"3" = {
		from_port			= 8080
		to_port				= 8080
		protocol			= "tcp"
		cidr_blocks			= ["10.153.30.0/23"]
		description			= "TomCat port within private subnet"
	},
	"4" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "SSH From Palo VPN"
	},
	"5" = {
		from_port			= 22
		to_port				= 22
		protocol			= "tcp"
		cidr_blocks			= ["10.33.98.128/32"]
		description			= "SSH from ProdSys7"
	},
	"6" = {
		from_port			= 80
		to_port				= 80
		protocol			= "tcp"
		cidr_blocks			= ["10.64.0.0/16"]
		description			= "HTTP From FMG VPN"
	},
    "7" = {
		 from_port			= 443
		 to_port			= 443
		 protocol			= "tcp"
		 cidr_blocks		= ["10.64.0.0/16"]
		 description		= "HTTPS From Palo VPN"
	},
	"8" = {
    	from_port			= 443
		to_port				= 443
		protocol			= "tcp"
		cidr_blocks			= ["10.33.98.128/32"]
		description			= "HTTPS From ProdSys7"
    },
    "9" = {
	    from_port			= 443
	    to_port				= 443
	    protocol			= "tcp"
	    cidr_blocks			= ["10.153.30.0/23"]
	    description			= "HTTPS From Private Subnet"
    }  
}

lb_name						= "fmg-digital-nlb-serverless-pci"
lb_type						= "network"
lb_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08012024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08032024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}
lb_subnets						= ["subnet-0a33ed77fe2cfb6ef", "subnet-0a797df6e7dcae3db"]
lb_enable_deletion_protection	= true
lb_internal_bool				= true
lb_bucket_name					= "franklin-alb-access-logs-pci"
lb_idle_timeout					= 120

tg_name								= "fmg-digital-serverless-tg-pci"
tg_health_check_port				= "traffic-port"
port								= 80
tg_protocol							= "TCP"
tg_vpc_id							= "vpc-00bd4d2758879b1e0"
tg_deregistration_delay				= 300
tg_healthy_threshold				= 5
tg_interval							= 30
tg_unhealthy_threshold				= 2
tg_health_check_timeout				= 10
tg_health_check_protocol			= "HTTP"
tg_target_type						= "ip"
tg_health_check_path				= "/actuator/health"
tg_tags = {
	"ApplicationName"		= "Digital"
	"Automated"				= "True"
	"BackupPlan"			= "None"
	"CostCenter"			= "FMG"
	"CreatedBy"				= "DevOps"
	"CreatedOn"				= "08012024"
	"DataClassification"	= "PCI"
	"Department"			= "DGT"
	"Infrastructure"		= "False"
	"LastUpdated"			= "08032024"
	"TechStack"				= "AWS"
	"Usage"					= "Project"
	"Version"				= "1.0"
}

lbl_health_check_port				= 80
lbl_protocol						= "TCP"
lbl_default_action_type				= "forward"
