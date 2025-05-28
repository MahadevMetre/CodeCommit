group_names = ["NGINX-EC2-Scaling",
    "JBOSS-EC2-Scaling"]
notifications = ["autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
    "autoscaling:TEST_NOTIFICATION"]
topic_arn = "arn:aws:sns:us-east-1:702230634984:autoscaling_stage_topic"