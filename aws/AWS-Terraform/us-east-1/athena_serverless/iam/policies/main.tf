module "iam_policy" {
	source						= "../../../../modules/iam/policy/"
	iam_policy_name					= var.iam_policy_name
	iam_role_id				    = var.iam_role_id
	athena-serverless-parameter	= var.athena-serverless-parameter
	ssm_parameter_arn 			= var.ssm_parameter_arn
	kms_key						= var.kms_key
}