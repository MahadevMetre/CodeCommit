health_check_port = 9993
protocol = "HTTPS"
target_group_name = "jboss-insuranceApps-tg-stage"
vpc_id   = "vpc-0051d323df13c7db3"
protocol_version = "HTTP1"
healthy_threshold = 5
interval = 30
unhealthy_threshold = 2
health_check_timeout = 5
load_balancing_algorithm_type = "least_outstanding_requests"