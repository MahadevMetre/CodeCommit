module "iam_policy" {
	source						= "../../../../modules/iam/policy/"
	iam_policy_name					= var.iam_policy_name
	iam_role_id				    = var.iam_role_id
	atlas-serverless-parameter	= var.atlas-serverless-parameter
	ssm_parameter_arn 			= var.ssm_parameter_arn
	digital-serverless-ses      = var.digital-serverless-ses
}