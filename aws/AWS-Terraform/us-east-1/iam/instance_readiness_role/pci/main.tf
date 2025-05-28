module "roles_with_managed_policy" {
    source              =  "../../../../modules/iam/roles_managed_policy/"
    role_name           = var.role_name
    role_tags           = var.role_tags
    iam_role_desc       = var.iam_role_desc
    managed_policy_arns = var.managed_policy_arns
    user_defined_policy = var.user_defined_policy
    principal_type      = var.principal_type
    identifiers         = var.identifiers
    statement_id        = var.statement_id
    policy_effects      = var.policy_effects
    actions             = var.actions
    parameter_arn       = var.parameter_arn
}