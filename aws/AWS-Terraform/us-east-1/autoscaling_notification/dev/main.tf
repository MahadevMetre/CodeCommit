module "autoscaling_notification" {
    source = "../../../modules/autoscaling/autoscaling_notification"
    group_names = var.group_names
    notifications = var.notifications
    topic_arn = var.topic_arn
}