resource "aws_sfn_state_machine" "my_sfn" {
	name		= var.sfn_name
	role_arn	= var.sfn_iam_role_arn
	definition	= templatefile((var.sfn_definition_json),
	{
		create_batch_lambda_arn = var.create_batch_lambda_arn,
		update_batch_lambda_arn = var.update_batch_lambda_arn,
		dynamodb_table_name = var.dynamodb_table_name,
		gluejob_name = var.gluejob_name
	})
	logging_configuration {
		log_destination			= var.sfn_log_destination
		include_execution_data	= true
		level					= "ALL"
	}
	// Ignore any changes made to the step definition
	tags		= var.sfn_tags
	lifecycle {
		ignore_changes = [definition]
	}
}