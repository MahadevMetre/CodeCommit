module "ses_domain_verification" {
	source						=		"../../../modules/ses/composite_ses/"
	ses_domain_name				=		var.ses_domain_name
	attach_ses_policy			=		var.attach_ses_policy
	iam_user_arn				=		var.iam_user_arn
	ses_sending_policy_name		=		var.ses_sending_policy_name
}