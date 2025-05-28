module "iam_user" {
  source               = "../../../../modules/iam/users/"
  iam_user_name        = var.iam_user_name
  iam_user_tags        = var.iam_user_tags
  iam_policy_name      = var.iam_policy_name
  dashboard_rds_policy = var.dashboard_rds_policy
}

