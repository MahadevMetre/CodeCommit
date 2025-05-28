resource "aws_lb" "alb" {
	name						=	var.name
	load_balancer_type			=	var.load_balancer_type
	tags						=	var.tags
	subnets						=	var.subnets
	security_groups				=	var.security_groups 
	enable_deletion_protection	=	var.enable_deletion_protection
	internal					=	var.internal_bool
	access_logs {
					bucket		=	var.bucket_name
					prefix		=	var.name
					enabled		=	true
	}
	idle_timeout				=	var.idle_timeout
}