resource "aws_cloudwatch_log_group" "my_log_group" {
	name = var.cloudwatch_log_group_name
	retention_in_days = var.cloudwatch_log_group_retention
	tags = var.cloudwatch_log_group_tags
}