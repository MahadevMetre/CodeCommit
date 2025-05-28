module "iam_policy" {
  source                   = "../../../../modules/iam/user_policy/"
  iam_policy_name          = var.iam_policy_name
  iam_policy_desc          = var.iam_policy_desc
  iam_policy_tags          = var.iam_policy_tags
  dashboard_rds_dbuser_arn = var.dashboard_rds_dbuser_arn
  dashboard_rds_policy     = var.dashboard_rds_policy
}

