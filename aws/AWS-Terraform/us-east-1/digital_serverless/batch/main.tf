data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_scheduler_schedule_group" "digital_serverless" {
	count	= var.create_schedule_group ? 1: 0
	name	= var.schedule_group_name
	tags	= var.schedule_group_tags
}

