resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = var.sg_id
  network_interface_id = var.network_interface_id
}


data "aws_instance" "instance" {
    count = var.attach_to_instance_bool ? 1 : 0
    instance_id = var.instance_id
}