// loadbalancer values
lb_name								=	"jboss-digital-nlb-dr"
lb_type								=	"network"
lb_tags								= {
	"ApplicationName" = "Digital"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03202023"
	"DataClassification" = "Low"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03202023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name" = "jboss-digital-nlb-dr"
									}
lb_subnets							=	["subnet-0b927d24fec28d40b", "subnet-0a1d3486597f552fe"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-dr"

// target_group values
tg_name								=	"jboss-digital-nlb-tg-dr"
tg_health_check_port				=	9993
tg_protocol							=	"TLS"
tg_vpc_id							=	"vpc-0e79e26eb537504d0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	3
tg_interval							=	30
tg_unhealthy_threshold				=	3
tg_health_check_timeout				=	10
health_check_protocol				= 	"HTTPS"

#Route53 Segment
zone_id = "Z00624956N47Z2N3AN6I"
route53_name = "dr.mtservices.fmservice.com"
route53_type = "A"
ttl = 300

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-west-2:214946096060:certificate/eddd404d-ff6f-4655-821e-f533d7104fee"
lbl_health_check_port				=	443
lbl_protocol						=	"TLS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

# TG attachment
scaling_name 						= "jboss-digital-ec2-scaling-dr"