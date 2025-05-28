# Variables
variable "ec2_region" {
  description = "The AWS region for the EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone for the resources"
  type        = string
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  type        = string
}

variable "public_ip_bool" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
}

variable "key_name" {
  description = "The key pair name for the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the EC2 instance"
  type        = string
}

variable "private_ip" {
  description = "Private IP address for the instance"
  type        = string
}

variable "disable_api_termination" {
  description = "Disable API termination for the instance"
  type        = bool
  default     = true
}

variable "root_volume_size" {
  description = "The size of the root block volume"
  type        = number
}

variable "root_volume_type" {
  description = "The volume type for the root block device"
  type        = string
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume"
  type        = number
}

variable "ebs_volume_type" {
  description = "The type of the EBS volume"
  type        = string
}

variable "attach_ebs_volume" {
  description = "Boolean to decide if EBS volume should be attached"
  type        = bool
  default     = false
}

variable "ebs_device_name" {
  description = "Device name for the EBS volume attachment"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description for the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "sg_ingress_rules" {
  description = "Ingress rules for the security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
}

variable "common_tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}
