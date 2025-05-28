scaling_name = "NGINX-EC2-Scaling"
vpc_zone_identifier = ["subnet-076a071fa0723c80e", "subnet-0ed61b6beb807094e"]
max_size = 3
min_size = 1
health_check_type = "ELB"
launch_configuration = "Nginx_node_config"
termination_policies = ["NewestInstance",
    "OldestLaunchConfiguration"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name = "nginx_autoscaling_policy"