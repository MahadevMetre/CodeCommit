module "lambda" {
    source             ="../../../modules/compute/lambda/processS3ArchiveEvent/"
    file_name          = "${var.file_name}" 
    function_name      = "${var.function_name}" 
    handler            = "${var.handler}" 
    runtime            = "${var.runtime}" 
    source_code_hash   = "${var.source_code_hash}" 
    memory_size        = "${var.memory_size}" 
    timeout            = "${var.timeout}" 
    kms_key_arn        = "${var.kms_key_arn}" 
    subnet_ids         = "${var.subnet_ids}" 
    security_group_ids = "${var.security_group_ids}" 
    environment        = "${var.environment}" 
    s3_bucket_arn_list = "${var.s3_bucket_arn_list}"
    sqs_arn_list       = "${var.sqs_arn_list}"
    env                = "${var.env}"
    tags               = "${var.tags}"
}

