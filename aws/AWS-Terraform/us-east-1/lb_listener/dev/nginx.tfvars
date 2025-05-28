load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:116762271881:loadbalancer/app/UI-lb-dev/bb7829c30a7b07b2"
certificate_arn = "arn:aws:acm:us-east-1:116762271881:certificate/77e2cc81-9b47-475a-abde-b664bf16d8a9"
health_check_port = 443
protocol = "HTTPS"
default_action_type = "forward"
target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:116762271881:targetgroup/nginx-app-target-group-dev/b27c51141e27106a"