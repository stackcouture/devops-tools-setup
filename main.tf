module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_instance_tenancy = var.instance_tenancy
  vpc_name             = var.vpc_name
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}

module "igw" {
  source   = "./modules/igw"
  vpc_id   = module.vpc.vpc_id
  igw_name = var.igw_name
}

module "subnet" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  public_subnet_names = var.public_subnet_names
  public_subnet_cidrs = var.public_subnet_cidrs
  subnet_az_names     = var.subnet_az_names
}

module "sg" {
  source                    = "./modules/sg"
  vpc_id                    = module.vpc.vpc_id
  vpc_cidr_block            = module.vpc.vpc_cidr_block
  sg_name                   = var.sg_name
  artifact_analysis_sg_name = var.artifact_analysis_sg_name
  bastion_sg_name           = var.bastion_sg_name
}

module "rt" {
  source              = "./modules/rt"
  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.subnet.public_subnet_ids
  internet_gateway_id = module.igw.igw_id
  public_rt_name      = var.public_rt_name
}

module "jenkins_server" {
  source           = "./modules/instance"
  instance_type    = var.jenkins_instance_type
  instance_tag     = var.jenkins_instance_tag
  key_name         = "jenkins-server-key"
  pem_file_name    = "jenkins-server-key.pem"
  public_subnet_id = module.subnet.public_subnet_ids[0]
  sg_id            = module.sg.sg_id
  az_name          = var.subnet_az_names[0]
}

module "jenkins_agent" {
  source           = "./modules/instance"
  instance_type    = var.jenkins_agent_instance_type
  instance_tag     = var.jenkins_agent_instance_tag
  key_name         = "jenkinsagent-key"
  pem_file_name    = "jenkinsagent-key.pem"
  public_subnet_id = module.subnet.public_subnet_ids[1]
  sg_id            = module.sg.sg_id
  az_name          = var.subnet_az_names[1]
}

module "artifact_analysis_instnace" {
  source           = "./modules/instance"
  instance_type    = var.artifact_analysis_instnace_type
  instance_tag     = var.artifact_analysis_instnace_tag
  key_name         = "artifact-and-analysis-server-key"
  pem_file_name    = "artifact-and-analysis-server-key.pem"
  public_subnet_id = module.subnet.public_subnet_ids[2]
  sg_id            = module.sg.artifact_sg_id
  az_name          = var.subnet_az_names[0]
}

module "bastion_instnace" {
  source           = "./modules/instance"
  instance_type    = var.bastion_instnace_type
  instance_tag     = var.bastion_instnace_tag
  key_name         = "bastion-server-key"
  pem_file_name    = "bastion-server-key.pem"
  public_subnet_id = module.subnet.public_subnet_ids[3]
  sg_id            = module.sg.bastion_sg_id
  az_name          = var.subnet_az_names[1]
}