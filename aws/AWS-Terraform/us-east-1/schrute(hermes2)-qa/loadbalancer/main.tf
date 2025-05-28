module "alb" {
   source = "../../../modules/loadbalancing/loadbalancer" 
   name = var.name
   load_balancer_type = var.load_balancer_type
   tags = var.tags
   subnets = var.subnets
   security_groups = var.security_groups 
   enable_deletion_protection = var.enable_deletion_protection
}