module "secrets" {
	source				= "../../../modules/secrets/"
	secret_name			= var.secret_name
	secret_description	= var.secret_description
	secret_rc_window	= var.secret_rc_window
	secret_tags			= var.secret_tags
	secret_values	= var.secret_values
}