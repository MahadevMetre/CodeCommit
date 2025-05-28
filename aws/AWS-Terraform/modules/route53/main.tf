resource "aws_route53_record" "i_hate_alias" {
  count = var.alias_record ? 0 : 1
  zone_id = var.zone_id
  name = var.name
  type = var.type
  ttl = var.ttl
  records = var.records
}

resource "aws_route53_record" "i_love_alias" {
  count = var.alias_record ? 1 : 0
  zone_id = var.zone_id
  name = var.name
  type = var.type
alias {
    name = var.alias_name
    zone_id = var.alias_zone_id
    evaluate_target_health = var.alias_evaluate_target_health
  }
}
