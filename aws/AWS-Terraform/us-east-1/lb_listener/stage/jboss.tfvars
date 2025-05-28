load_balancer_arn = "arn:aws:elasticloadbalancing:us-east-1:702230634984:loadbalancer/app/JBOSS-lb-stage/46e76f0af7233aad"
certificate_arn = "arn:aws:acm:us-east-1:702230634984:certificate/bda3326f-6fa1-44bb-9a77-5672f749da43"
health_check_port = 443
protocol = "HTTPS"
default_action_type = "forward"
target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:702230634984:targetgroup/jboss-insuranceApps-tg-stage/daed86bfeb386764"