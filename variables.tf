# VPC 
variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR Block"
}

variable "instance_tenancy" {
  type        = string
  description = "VPC Instance Tenancy"
}

variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enable DNS Support"
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enable DNS Hostnam"
}

#Internet Gateway 

variable "igw_name" {
  type        = string
  description = "Internet Gateway Name"
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


# Security Group 

variable "sg_name" {
  type        = string
  description = "Security group name"
}

variable "artifact_analysis_sg_name" {
  type        = string
  description = "Artifact Analysis Security Group"
}

variable "bastion_sg_name" {
  type        = string
  description = "Bastion Security Group"
}


# Route Table 
variable "public_rt_name" {
  type        = string
  description = "Public Route Table Name"
}

# EC2 Instane 

variable "jenkins_instance_type" {
  type        = string
  description = "Jenkins Master Instance Type"
}

variable "jenkins_instance_tag" {
  type        = string
  description = "Jenkins Agent Tag"
}


# Jenkins Agent 
variable "jenkins_agent_instance_tag" {
  type        = string
  description = "Jenkins Agent Tag"
}

variable "jenkins_agent_instance_type" {
  type        = string
  description = "Jenkins Agent Instance Type"
}

variable "artifact_analysis_instnace_type" {
  type        = string
  description = "Artifact Analysis Instance Type"
}

variable "artifact_analysis_instnace_tag" {
  type        = string
  description = "artifact_analysis Instance Tag"
}

variable "bastion_instnace_type" {
  type        = string
  description = "Bastion Instance Type"
}

variable "bastion_instnace_tag" {
  type        = string
  description = "Bastion Instance Tag"
}


