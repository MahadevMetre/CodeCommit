#rule
listener_arn        = "arn:aws:elasticloadbalancing:us-east-1:116762271881:listener/app/jboss-insuranceapps-alb-dev/6b90e3d19f704505/789d8af63e2bab2e"
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
	"CreatedOn" = "10182021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "08022023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#target group
tg_name								= "insuranceapps-batch-tg-dev"
tg_health_check_port				= 9993
tg_protocol							= "HTTPS"
tg_vpc_id							= "vpc-00ff8e33839358d28"
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
	"CreatedOn" = "10182021"
	"DataClassification" = "None"
	"Department" = "IAPPS"
	"Infrastructure" = "False"
	"LastUpdated" = "08022023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#target attachment
target_instance_id					= "i-0439e5c96fcd13830"