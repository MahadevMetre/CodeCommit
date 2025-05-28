module "role" {
	source									= "../../../../modules/iam/roles/"
	role_name								= var.role_name
	role_tags								= var.role_tags
	iam_role_desc							= var.iam_role_desc
	admins_policy                           = var.admins_policy
	admins_policy_arn                       = var.admins_policy_arn
    automation_qa_lead_policy               = var.automation_qa_lead_policy
	automation_qa_lead_policy_arn           = var.automation_qa_lead_policy_arn
    leads_policy                            = var.leads_policy
	leads_policy_arn                        = var.leads_policy_arn
    rml_policy                              = var.rml_policy
	rml_policy_arn                          = var.rml_policy_arn
    support_ui_dev_policy                   = var.support_ui_dev_policy
	support_ui_dev_policy_arn               = var.support_ui_dev_policy_arn
    ui_dev_policy                           = var.ui_dev_policy
	ui_dev_policy_arn                       = var.ui_dev_policy_arn
}