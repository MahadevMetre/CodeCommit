module "glue_connection" {
	source = "../../../modules/glue/connection/"
	conn_name = var.conn_name
	connection_type = var.connection_type
	jdbc_url = var.jdbc_url
	jdbc_pwd = var.jdbc_pwd
	jdbc_uid = var.jdbc_uid
	availability_zone = var.availability_zone
	sg_list = var.sg_list
	subnet_id = var.subnet_id
}