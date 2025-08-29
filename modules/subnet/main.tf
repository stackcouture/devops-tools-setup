resource "aws_subnet" "public_subnets" {
  count      = length(var.public_subnet_names)
  vpc_id     = var.vpc_id
  cidr_block = var.public_subnet_cidrs[count.index]
  #availability_zone = var.subnet_az_names[count.index]
  availability_zone = element(var.subnet_az_names, count.index % length(var.subnet_az_names))
  tags = {
    Name = var.public_subnet_names[count.index]
  }
}