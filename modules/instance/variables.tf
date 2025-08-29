variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "instance_tag" {
  description = "Tag to name the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name for the EC2 key pair"
  type        = string
}

variable "pem_file_name" {
  description = "Filename for the PEM private key"
  type        = string
}

variable "public_subnet_id" {
  type = string
}

variable "sg_id" {
  type = string
}

variable "az_name" {
  type = string
}