resource "aws_efs_file_system" "efs_file_system" {
   creation_token = var.efs_name
   performance_mode = var.efs_perf_mode
   throughput_mode = var.efs_throughput_mode
   encrypted = var.efs_encrypted
   tags = var.efs_tags
   kms_key_id = var.kms_key_id
}


resource "aws_security_group" "efs_security_group" {
	name = var.efs_security_group_name
	vpc_id = var.vpc_id
	ingress {
		from_port = 2049
		to_port = 2049
		protocol = "tcp"
		self = true
		description = "NFS from resources with this security group attached"
	}
	dynamic "ingress" {
		for_each = var.sg_ingress_rules
		content {
		from_port	= ingress.value.from_port
		to_port		= ingress.value.to_port
		protocol	= ingress.value.protocol
		cidr_blocks	= ingress.value.cidr_blocks
		description	= ingress.value.description
		}
	}
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		self = true
	}
	tags = var.efs_sg_tags
}

resource "aws_efs_mount_target" "connect_efs" {
   file_system_id = aws_efs_file_system.efs_file_system.id
   subnet_id = var.subnet_id
   security_groups = [aws_security_group.efs_security_group.id]
}

resource "aws_efs_mount_target" "connect_efs_subnet2" {
   count = var.efs_attach_to_second_subnet ? 1 : 0
   file_system_id = aws_efs_file_system.efs_file_system.id
   subnet_id = var.subnet2_id
   security_groups = [aws_security_group.efs_security_group.id]
}