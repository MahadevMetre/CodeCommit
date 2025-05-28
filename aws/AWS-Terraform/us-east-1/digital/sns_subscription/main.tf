module "sns_sub" {
    source		=	"../../../modules/sns/sns_subscription/"
    topic_arn	=	var.topic_arn
    protocol	=	var.protocol
    endpoint	=	var.endpoint
}