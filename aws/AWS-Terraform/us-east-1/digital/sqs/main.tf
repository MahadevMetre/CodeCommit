module "sqs_queue" {
    source						= "../../../modules/sqs/sqs_queue/"
    sqs_queue_name              = var.sqs_queue_name
    environment                 = var.environment
    s3_pub_iam_consumer         = var.s3_pub_iam_consumer
    standard_pub_iam_sub        = var.standard_pub_iam_sub
    s3_bucket_arn               = var.s3_bucket_arn
    iam_role_arn                = var.iam_role_arn
    publisher_list              = var.publisher_list
    consumer_list               = var.consumer_list
    delete_sqs_message          = var.delete_sqs_message
    delete_sqs_msg_iam_arn_list = var.delete_sqs_msg_iam_arn_list
    tags                        = var.tags
	sns_publisher_policy		= var.sns_publisher_policy
    receive_message             = var.receive_message
    dig_confirm_user_incoming	= var.dig_confirm_user_incoming
    dig_confirm_user_error		= var.dig_confirm_user_error
    root_arn                    = var.root_arn
}