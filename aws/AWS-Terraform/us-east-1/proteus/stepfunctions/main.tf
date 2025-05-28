module "ce_log_group" {
	source = "../../../modules/cloudwatch/loggroup/"
	count = var.create_log_group_bool ? 1: 0
	cloudwatch_log_group_name = var.cloudwatch_log_group_name
	cloudwatch_log_group_retention = var.cloudwatch_log_group_retention
	cloudwatch_log_group_tags = var.cloudwatch_log_group_tags
}

module "aws_sfn" {
	source = "../../../modules/stepfunctions/"
	sfn_name = var.sfn_name
	sfn_iam_role_arn = var.sfn_iam_role_arn
	sfn_definition_json = var.sfn_definition_json
	create_batch_lambda_arn = var.create_batch_lambda_arn
	update_batch_lambda_arn = var.update_batch_lambda_arn
	dynamodb_table_name = var.dynamodb_table_name
	gluejob_name = var.gluejob_name
	sfn_log_destination = "${module.ce_log_group[0].cw_log_group_out.arn}:*"
	sfn_tags = var.sfn_tags
}