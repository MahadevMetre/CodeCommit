scaling_name = "JBOSS-EC2-Scaling"
vpc_zone_identifier = []
max_size = 3
min_size = 1
health_check_type = "ELB"
launch_configuration = "jboss_slave_config"
termination_policies = ["NewestInstance",
    "OldestLaunchConfiguration"]
enabled_metrics = ["GroupInServiceCapacity",
    "GroupMaxSize",
    "GroupTotalCapacity",
    "GroupTotalInstances",
    "GroupMinSize"]
health_check_grace_period = 300
policy_name = "jboss_autoscaling_policy"