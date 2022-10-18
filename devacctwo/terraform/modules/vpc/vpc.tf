data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_count = length(data.aws_availability_zones.available.names)
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(var.tags,{
               Name = var.vpc_name
               })
}

resource "aws_subnet" "public_subnet" {
  count = length(var.cidr_subnet_public)
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet_public[count.index]
  availability_zone = local.az_count > count.index ? data.aws_availability_zones.available.names[count.index] : data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = merge(var.tags,{
               Name = "${var.vpc_name}-public-${count.index}"
               })
}

#resource "aws_subnet" "private_subnet" {
#  count = length(var.cidr_subnet_public)
#  vpc_id = aws_vpc.vpc.id
#  cidr_block = var.cidr_subnet_private[count.index]
#  availability_zone = local.az_count > count.index ? data.aws_availability_zones.available.names[count.index] : data.aws_availability_zones.available.names[0]
#  map_public_ip_on_launch = true
#  tags = merge(var.tags,{
#               Name = "${var.vpc_name}-private-${count.index}"
#               })
#}

resource "aws_route_table" "rt_public" {
  count = length(var.cidr_subnet_public)
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(var.tags,{
               Name = "${var.vpc_name}-public-${count.index}"
               })
}

#resource "aws_route_table" "rt_private" {
#  count = length(var.cidr_subnet_private)
#  vpc_id = aws_vpc.vpc.id
#  tags = merge(var.tags,{
#               Name = "${var.vpc_name}-private-${count.index}"
#               })
#}

resource "aws_route_table_association" "puba" {
  count = length(var.cidr_subnet_public)
  subnet_id = aws_subnet.public_subnet.*.id[count.index]
  route_table_id = aws_route_table.rt_public.*.id[count.index]
}

#resource "aws_route_table_association" "pria" {
#  count = length(var.cidr_subnet_private)
#  subnet_id = aws_subnet.private_subnet.*.id[count.index]
#  route_table_id = aws_route_table.rt_private.*.id[count.index]
#}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(var.tags,{
               Name = "${var.vpc_name}-igw"
               })
}
