module "parameter" {
  source      = "../../../modules/parameter-store"
  name        = var.name
  description = var.description
  type        = var.type
  value       = var.value
  key_id      = var.key_id
  tier        = var.tier
  tags        = var.tags
}