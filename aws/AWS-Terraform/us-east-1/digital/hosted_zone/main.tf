module "hosted_zone" {
  source = "../../../modules/route53/hosted_zone"
  
  domain_name = var.domain_name
  vpc_id = var.vpc_id
}