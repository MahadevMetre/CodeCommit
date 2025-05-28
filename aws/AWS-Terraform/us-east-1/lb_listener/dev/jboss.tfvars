load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:116762271881:loadbalancer/app/JBOSS-lb-dev/ecd687ba4839980e"
certificate_arn = "arn:aws:acm:us-east-1:116762271881:certificate/2dda2997-27e7-43a0-93f6-91d6d281be3b"
health_check_port = 443
protocol = "HTTPS"
default_action_type = "forward"
target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:116762271881:targetgroup/jboss-insuranceApps-tg-dev/330ba487077da748"