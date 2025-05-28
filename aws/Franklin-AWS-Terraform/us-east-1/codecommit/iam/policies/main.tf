module "iam_policy" {
	source						= "../../../../modules/iam/user_policy/"
	iam_policy_name				= var.iam_policy_name
	iam_policy_desc				= var.iam_policy_desc
	iam_policy_tags				= var.iam_policy_tags
	admins_policy               = var.admins_policy
	automation_qa_lead_policy   = var.automation_qa_lead_policy
	leads_policy                = var.leads_policy
	rml_policy                  = var.rml_policy
	support_ui_dev_policy       = var.support_ui_dev_policy
	ui_dev_policy               = var.ui_dev_policy
	region                      = var.region
	account_id                  = var.account_id
	repository_name             = var.repository_name
}