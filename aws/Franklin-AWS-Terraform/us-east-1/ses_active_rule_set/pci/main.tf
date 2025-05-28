module "sqs_queue" {
    source ="../../../modules/ses/rule_set"
    rule_set_name    = var.rule_set_name
}