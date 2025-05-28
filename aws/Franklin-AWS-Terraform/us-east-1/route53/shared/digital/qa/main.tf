module "route53" {
	source							=	"../../../../../modules/route53/"
	alias_record					=	var.alias_record
	zone_id							=	var.zone_id
	name							=	var.name
	type							=	var.type
	ttl								=	var.ttl
	records							=	var.records
	alias_name						=	var.alias_name
	alias_zone_id					=	var.alias_zone_id
	alias_evaluate_target_health	=	var.alias_evaluate_target_health
}