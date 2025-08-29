resource "aws_security_group" "jenkins_sg" {
  name        = "Jenkins-SG"
  description = "Jenkins Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4" {
  security_group_id = aws_security_group.jenkins_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.jenkins_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.jenkins_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_custom_ipv4" {
  security_group_id = aws_security_group.jenkins_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8000
  ip_protocol       = "tcp"
  to_port           = 9000
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.jenkins_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Nexus Security Group 

resource "aws_security_group" "artifact_analysis_sg" {
  name        = "Artifact-Analysis-SG"
  description = "Artifact-Analysis Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.artifact_analysis_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_artifact_analysis_ssh_ipv4" {
  security_group_id = aws_security_group.artifact_analysis_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_nexus_custom_ipv4" {
  security_group_id = aws_security_group.artifact_analysis_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8081
  ip_protocol       = "tcp"
  to_port           = 8081
}

resource "aws_vpc_security_group_ingress_rule" "allow_dp_track_analysis_custom_ipv4" {
  security_group_id = aws_security_group.artifact_analysis_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8082
  ip_protocol       = "tcp"
  to_port           = 8082
}

resource "aws_vpc_security_group_ingress_rule" "allow_sonar_analysis_custom_ipv4" {
  security_group_id = aws_security_group.artifact_analysis_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 9000
  ip_protocol       = "tcp"
  to_port           = 9000
}

resource "aws_vpc_security_group_egress_rule" "allow_all_analysis_traffic_ipv4" {
  security_group_id = aws_security_group.artifact_analysis_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Basion Security Group 

resource "aws_security_group" "bastion_sg" {
  name        = "Bastion-SG"
  description = "Bastion Security Group"
  vpc_id      = var.vpc_id

  tags = {
    Name = var.bastion_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_bastion_ssh_ipv4" {
  security_group_id = aws_security_group.bastion_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_bastion_traffic_ipv4" {
  security_group_id = aws_security_group.bastion_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}