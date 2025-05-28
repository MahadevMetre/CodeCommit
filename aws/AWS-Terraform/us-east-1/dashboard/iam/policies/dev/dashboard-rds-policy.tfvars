iam_policy_name = "dashboard-rds-policy-dev"
iam_policy_tags = {
  Department         = "DSB"
  LastUpdated        = "06272024"
  CostCenter         = "FMG"
  CreatedOn          = "06272024"
  DataClassification = "Low"
  Infrastructure     = "False"
  Usage              = "Project"
  Version            = "1.0"
  ApplicationName    = "DashBoard"
  TechStack          = "AWS"
  Automated          = "True"
  BackupPlan         = "None"
  CreatedBy          = "DevOps"

}

dashboard_rds_policy     = "true"
dashboard_rds_dbuser_arn = "arn:aws:rds-db:us-east-1:116762271881:dbuser:prx-0ca764ba4d64642d3/*"
iam_policy_desc          = "Dashboard Access RDS Dev"

