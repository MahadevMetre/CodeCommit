#rule
listener_arn        = "arn:aws:elasticloadbalancing:us-west-2:214946096060:listener/app/jboss-iapps-alb-dr/745cc1c0bfd1ff9a/b06618f1feddef0d"
priority            = 1
action_type         = "forward"
path_pattern        = [
	"/*batch*-w*",
	"/salesforcefileintegration-web/*"
]
rule_tag			= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "01162023"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "02262024"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#target group
tg_name								= "insuranceapps-batch-tg-dr"
tg_health_check_port				= 9993
tg_protocol							= "HTTPS"
tg_vpc_id							= "vpc-0e79e26eb537504d0"
tg_protocol_version					= "HTTP1"
tg_healthy_threshold				= 5
tg_interval							= 120
tg_unhealthy_threshold				= 5
tg_health_check_timeout				= 30
tg_load_balancing_algorithm_type	= "least_outstanding_requests"
tg_tags								= {
	"ApplicationName" = "InsuranceApps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "01162023"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "02262024"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#target attachment
target_instance_id					= "i-0e6dd8daab666de8f"