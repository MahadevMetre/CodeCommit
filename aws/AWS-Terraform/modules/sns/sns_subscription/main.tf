resource "aws_sns_topic_subscription" "sns_subscriptions" {
	topic_arn		=	var.topic_arn
	protocol		= 	var.protocol
	endpoint		=	var.endpoint
}