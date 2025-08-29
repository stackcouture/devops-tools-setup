variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_subnet_names" {
  type        = list(string)
  description = "Public Subnet Names"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR Blocks"
}

variable "subnet_az_names" {
  type        = list(string)
  description = "Subnet AZ Names"
}


