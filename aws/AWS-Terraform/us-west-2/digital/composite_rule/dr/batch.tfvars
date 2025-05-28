#rule
listener_arn        = "arn:aws:elasticloadbalancing:us-west-2:214946096060:listener/app/jboss-digital-alb-dr/a6962b32bf8e59e6/a8513713dbb35cd5"
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
	"CreatedBy" = "mfaizudeen"
	"CreatedOn" = "03182023"
	"DataClassification" = "None"
	"Department" = "DGT"
	"Infrastructure" = "False"
	"LastUpdated" = "03182023"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	"Name"	= "Digital Batch cluster Url rule in LB"
}

#target group
tg_name				                =   "digital-batch-tg-dr"
tg_health_check_port				=	9993
tg_protocol							=	"HTTPS"
tg_vpc_id							=	"vpc-0e79e26eb537504d0"
tg_protocol_version					=	"HTTP1"
tg_healthy_threshold				=	5
tg_interval							=	120
tg_unhealthy_threshold				=	5
tg_health_check_timeout				=	30
tg_load_balancing_algorithm_type	=	"least_outstanding_requests"

#target attachment
target_instance_id        = "i-0dcab30830ac50205"