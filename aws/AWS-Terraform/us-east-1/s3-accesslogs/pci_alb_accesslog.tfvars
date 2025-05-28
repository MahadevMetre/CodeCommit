s3_bucketName       = "franklin-alb-access-logs"
environment         = "pci"
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
	"Name" = "franklin-alb-access-logs-pci"
	"TechStack" = "AWS"
	"Usage" = "Project"
	"Version" = "1.0"
	}

# Policy
alb_access_log_policy             = true
jboss_alb                         = "jboss-iapps-alb-pci"
nginx_alb                         = "nginx-iapps-app-alb-pci"
aws_referer                       = "601751840347"
dig_jboss_alb					  = "jboss-digital-alb-pci"
dig_jboss_nlb					  = "jboss-digital-nlb-pci"
dig_nginx_alb					  = "nginx-dig-app-alb-pci"