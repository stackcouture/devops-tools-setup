variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "sg_name" {
  type        = string
  description = "Security group name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "artifact_analysis_sg_name" {
  type        = string
  description = "Artifact Analysis Security Group"
}

variable "bastion_sg_name" {
  type        = string
  description = "Bastion Security Group"
}