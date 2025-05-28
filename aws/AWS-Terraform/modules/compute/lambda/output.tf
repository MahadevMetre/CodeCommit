output "lambda_arns_local"{
  value = "${element(concat(aws_lambda_function.lambda.*.arn, list("")), 0)}"
}


output "name"{
  value = "${element(concat(aws_lambda_function.lambda.*.function_name, list("")), 0)}"
}
