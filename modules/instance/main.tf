resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh
  depends_on = [tls_private_key.ec2_key]
}

# Save the private key to a local file in .pem format
resource "local_file" "private_key" {
  filename        = "keys/${path.root}/${var.pem_file_name}"
  content         = tls_private_key.ec2_key.private_key_pem
  file_permission = "0400" # Read-only by the owner
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids      = [var.sg_id]
  availability_zone           = var.az_name
  associate_public_ip_address = true
  root_block_device {
    volume_size = 20    # in GiB
    volume_type = "gp3" # General Purpose SSD
  }
  tags = {
    Name = var.instance_tag
  }
}
