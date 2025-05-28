module "secrets" {
  source				= "../secrets/"
  secret_name			= var.secret_name
  secret_description	= var.secret_description
  secret_rc_window		= var.secret_rc_window
  secret_tags			= var.secret_tags
  secret_values	= var.secret_values
}

module "security_group" {
  source			= "../networking/securitygroups"
  name				= var.sg_name
  description		= var.sg_description
  vpc_id			= var.sg_vpc_id
  sg_ingress_rules	= var.sg_ingress_rules
  tags				= var.sg_tags
}

resource "aws_db_proxy" "my_db_proxy" {
  name                   = var.rds_proxy_name
  debug_logging          = var.rds_proxy_debug_logging
  engine_family          = var.rds_proxy_engine
  idle_client_timeout    = var.rds_proxy_idle_timeout
  require_tls            = var.rds_proxy_tls
  role_arn               = var.rds_proxy_role_arn
  vpc_security_group_ids = ["${module.security_group.sgOut.id}"]
  vpc_subnet_ids         = var.rds_proxy_vpc_subnets

  auth {
    auth_scheme			= var.rds_proxy_auth_scheme
    description			= var.rds_proxy_auth_description
    iam_auth			= var.rds_proxy_auth_iam
    secret_arn			= module.secrets.my_secret_out.arn
  }
  tags					= var.rds_proxy_tags
}

resource "aws_db_proxy_default_target_group" "my_db_proxy_tg" {
  db_proxy_name					= aws_db_proxy.my_db_proxy.name
  connection_pool_config {
    connection_borrow_timeout		= var.rds_proxy_tg_connection_borrow_timeout
	max_idle_connections_percent	= var.rds_proxy_tg_max_idle_connections_percent
    max_connections_percent			= var.rds_proxy_tg_max_connections_percent
  }
}

resource "aws_db_proxy_target" "my_db_proxy_target" {
  db_instance_identifier	= var.rds_proxy_target_db_identifier
  db_proxy_name				= aws_db_proxy.my_db_proxy.name
  target_group_name			= aws_db_proxy_default_target_group.my_db_proxy_tg.name
}