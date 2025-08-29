variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "public_rt_name" {
  type        = string
  description = "Public Route Table Name"
}

variable "internet_gateway_id" {
  type        = string
  description = "Internet Gateway Id"
}

variable "public_subnet_ids" {
  description = "Map of public subnet IDs"
  type        = map(string)
}