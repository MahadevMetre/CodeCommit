variable "sg_id" {
    type = string
}

variable "network_interface_id" {
    type = string
}

variable "attach_to_instance_bool" {
    type = bool
    default = false
}

variable "instance_id" {
    type = string
    default = null
}