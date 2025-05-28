s3_bucketName       = "franklin-alb-access-logs"
environment         = "qa"
acl                 = "private"
tags                = {
	"ApplicationName" = "DevOps"
	"Automated" = "True"
	"BackupPlan" = "None"
	"CostCenter" = "FMG"
	"CreatedBy" = "DevOps"
	"CreatedOn" = "NoInfo"
	"DataClassification" = "Low"
	"Department" = "DOS"
	"Infrastructure" = "False"
	"LastUpdated" = "06262023"
	"Name" = "franklin-alb-access-logs-qa"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	}

# Policy
alb_access_log_policy             = true
jboss_alb                         = "jboss-iapps-alb-qa"
nginx_alb                         = "nginx-iapps-app-alb-qa"
aws_referer                       = "634621569833"
dig_jboss_alb					  = "jboss-digital-alb-qa"
dig_jboss_nlb					  = "jboss-digital-nlb-qa"
dig_nginx_alb					  = "nginx-dig-app-alb-qa"