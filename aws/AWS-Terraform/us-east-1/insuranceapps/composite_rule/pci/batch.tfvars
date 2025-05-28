#rule
listener_arn        = "arn:aws:elasticloadbalancing:us-east-1:601751840347:listener/app/jboss-iapps-alb-pci/1729a6decdd5c0a4/56d562a052942507"
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
	"LastUpdated" = "08232023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#target group
tg_name								= "insuranceapps-batch-tg-pci"
tg_health_check_port				= 9993
tg_protocol							= "HTTPS"
tg_vpc_id							= "vpc-00bd4d2758879b1e0"
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
	"LastUpdated" = "08232023"
	"TechStack" = "JBoss"
	"Usage" = "Project"
	"Version" = "1.0"
	}

#target attachment
target_instance_id					= "i-0ec9c512b0aca4bf4"