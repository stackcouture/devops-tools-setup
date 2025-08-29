vpc_name             = "Dev-VPC"
vpc_cidr             = "10.0.0.0/16"
instance_tenancy     = "default"
enable_dns_support   = true
enable_dns_hostnames = true

#Internet Gateway 
igw_name = "VPC-IGW"

# Subnets 
public_subnet_names = ["Public-Subnet-1", "Public-Subnet-2", "Public-Subnet-3", "Public-Subnet-4"]
public_subnet_cidrs = ["10.0.0.0/26", "10.0.0.64/26", "10.0.0.128/26", "10.0.0.192/26"]
subnet_az_names     = ["ap-south-1a", "ap-south-1b"]

#Security Group 
sg_name                   = "Jenkins-SG"
artifact_analysis_sg_name = "Artificact-analysis-SG"
bastion_sg_name           = "Bastion-SG"

# Route Table 
public_rt_name = "Public-RT"

# EC2 Instance 
jenkins_instance_type = "t3.small"
jenkins_instance_tag  = "Jenkins Server"

jenkins_agent_instance_type = "t3.small"
jenkins_agent_instance_tag  = "Jenkins Agent"

artifact_analysis_instnace_type = "t3.large"
artifact_analysis_instnace_tag  = "Artifact and Analysis Server"

bastion_instnace_type = "t3.medium"
bastion_instnace_tag  = "Bastion Host"