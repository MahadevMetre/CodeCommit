module "route53" {
	source		=	"../../../modules/route53/"
	zone_id		=	var.zone_id
	name		=	var.name
	type		=	var.type
	ttl			=	var.ttl
	records		=	var.records
}