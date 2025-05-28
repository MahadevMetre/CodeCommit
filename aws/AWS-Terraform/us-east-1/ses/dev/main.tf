module "sqs_queue" {
    source ="../../../modules/ses/config_set"
    config_set_name = var.config_set_name
}