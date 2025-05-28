output "ami_out" {
  value = module.ami.get_ami
}

output "asg_out" {
  value = module.asg.asg_out
}

output "launch_template" {
    value = module.launch_template.launch_template
}

output "lb_out" {
  value = module.loadbalancer.alb
}

output "tg_out" {
  value = module.target_group.tgOut
}