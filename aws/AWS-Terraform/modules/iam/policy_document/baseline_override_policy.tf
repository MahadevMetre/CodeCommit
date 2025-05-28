data aws_iam_policy_document base_line_override_policy {
    statement {
        sid        = var.statement_id
        effect     = var.policy_effects
        actions    = var.actions
        resources  = var.parameter_arn
    }
}