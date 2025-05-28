module "key" {
	source						= "../../../modules/kms-WithPolicy/"
	description					= var.description
	key_usage					= var.key_usage
	customer_master_key_spec	= var.customer_master_key_spec
	is_enabled					= var.is_enabled
	enable_key_rotation			= var.enable_key_rotation
	tags						= var.tags
	alias_name					= var.alias_name
	lasso-kms-policy			= var.lasso-kms-policy
	multi_region				= var.multi_region
	iam_roles					= var.iam_roles
}