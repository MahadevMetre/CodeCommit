load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:702230634984:loadbalancer/app/UI-lb-stage/ca978c1da7b3f840"
certificate_arn = "arn:aws:acm:us-east-1:702230634984:certificate/d1b329d0-0e22-48f7-8bd9-9523cf660d33"
health_check_port = 443
protocol = "HTTPS"
default_action_type = "forward"
target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/nginx-app-target-group-stage/65bb15b67d908f38"