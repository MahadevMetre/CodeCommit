#rule
listener_arn        = "arn:aws:elasticloadbalancing:us-east-1:601751840347:listener/app/jboss-digital-alb-pci/e18fc5047cc13a36/4bb27d5392ae3620"
priority            = 1
action_type         = "forward"
path_pattern        = [
	"/marketingservicebatch/*",
	"/digitalservicebatch/*"
]
rule_tag            = {
	"ApplicationName" = "Digital"
    "Automated" = "True"
    "BackupPlan" = "None"
    "CostCenter" = "FMG"
    "CreatedBy" = "sbose"
    "CreatedOn" = "12302021"
    "DataClassification" = "PCI"
    "Department" = "DGT"
    "Infrastructure" = "False"
    "LastUpdated" = "06262023"
    "TechStack" = "AWS"
    "Usage" = "Project"
    "Version" = "1.0"
}

#target group
tg_name				= "digital-batch-tg-pci"
tg_health_check_port				=	9993
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-00bd4d2758879b1e0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	120
tg_unhealthy_threshold				=	5
tg_health_check_timeout				=	30
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"

#target attachment
target_instance_id        = "i-06b2d5f3fdb150c18"