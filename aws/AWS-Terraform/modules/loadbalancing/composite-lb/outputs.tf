output "lb_out" {
  value = module.loadbalancer.alb
}

output "tg_out" {
  value = module.target_group.tgOut
}