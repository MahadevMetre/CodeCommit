// loadbalancer values
lb_name								=	"jboss-digital-nlb-pci"
lb_type								=	"network"
lb_tags								= {
    "ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "DevOps"
    "CreatedOn" = "NoInfo"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
									}
 lb_subnets							=	["subnet-0a797df6e7dcae3db", 
	"subnet-0a33ed77fe2cfb6ef"]
lb_enable_deletion_protection		=	false
lb_internal_bool					=	true
lb_bucket_name						=	"franklin-alb-access-logs-pci"

// target_group values
tg_name								=	"jboss-digital-nlb-tg-pci"
tg_health_check_port				=	9993
tg_protocol							=	"TLS"
tg_vpc_id							=	"vpc-00bd4d2758879b1e0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	3
tg_interval							=	30
tg_unhealthy_threshold				=	3
tg_health_check_timeout				=	10
health_check_protocol				= 	"HTTPS"

#Route53 Segment
zone_id = "Z07293671OO698DPMPXYK"
route53_name = "mtservices.fmservice.com"
route53_type = "A"
ttl = 300

// lb_listener values
lbl_certificate_arn					=	"arn:aws:acm:us-east-1:601751840347:certificate/4da49c93-2fee-4f37-9bf5-a02612969e00"
lbl_health_check_port				=	443
lbl_protocol						=	"TLS"
lbl_default_action_type				=	"forward"
ssl_policy 							= 	"ELBSecurityPolicy-TLS-1-2-Ext-2018-06"

# TG attachment
scaling_name 						= "jboss-digital-ec2-scaling-pci"