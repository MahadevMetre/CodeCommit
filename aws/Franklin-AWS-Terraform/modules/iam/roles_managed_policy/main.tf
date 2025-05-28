resource "aws_iam_role" "instance_readiness_role" {
  name                = var.role_name
  tags				        = var.role_tags
  description		      = var.iam_role_desc
  assume_role_policy  = data.aws_iam_policy_document.assume_role_policy.json 
  managed_policy_arns = var.managed_policy_arns
}

resource "aws_iam_role_policy_attachment" "optional_attachment" {
  count      = var.user_defined_policy ? 1 : 0
  role       = aws_iam_role.instance_readiness_role.name
  policy_arn = aws_iam_policy.baseline_over_rides_s3.arn
}

module "policy_document" {
  source             = "../policy_document/"
  principal_type     = var.principal_type
  identifiers        = var.identifiers
  statement_id       = var.statement_id
  policy_effects     = var.policy_effects
  actions            = var.actions
  parameter_arn      = var.parameter_arn
}

module "policy" {
    source = "../policy"
    baseline_over_rides_s3  = var.baseline_over_rides_s3 
    policy_name             = var.policy_name
}
  