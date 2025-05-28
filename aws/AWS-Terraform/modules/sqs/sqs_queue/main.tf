## SQS Queue
resource "aws_sqs_queue" "sqs_queue" {
  name                       = format("%s_%s",var.sqs_queue_name,var.environment)
  visibility_timeout_seconds = 30
  tags                       = var.tags
}

## SQS Queue policy
module sqs_policy {
  source						= "../sqs_policy/"
  sqs_queue_url					= aws_sqs_queue.sqs_queue.id
  queue_arn						= aws_sqs_queue.sqs_queue.arn
  s3_pub_iam_consumer			= var.s3_pub_iam_consumer
  standard_pub_iam_sub			= var.standard_pub_iam_sub
  delete_sqs_message			= var.delete_sqs_message
  s3_bucket_arn_list			= var.s3_bucket_arn
  consumer_list					= var.consumer_list
  publisher_list				= var.publisher_list
  delete_sqs_msg_iam_arn_list	= var.delete_sqs_msg_iam_arn_list
  sns_publisher_policy			= var.sns_publisher_policy
  receive_message				= var.receive_message
  root_arn						= var.root_arn
  dig_confirm_user_incoming		= var.dig_confirm_user_incoming
  dig_confirm_user_error		= var.dig_confirm_user_error
}