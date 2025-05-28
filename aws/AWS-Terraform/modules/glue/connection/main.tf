resource "aws_glue_connection" "my_conn" {
	name = var.conn_name
	connection_type = var.connection_type
	connection_properties = {
		JDBC_CONNECTION_URL	= var.jdbc_url
		PASSWORD			= var.jdbc_pwd
		USERNAME			= var.jdbc_uid
	}
	physical_connection_requirements {
		availability_zone		= var.availability_zone
		security_group_id_list	= var.sg_list
		subnet_id				= var.subnet_id
	}
	lifecycle {
		ignore_changes = [connection_properties]
	}
}