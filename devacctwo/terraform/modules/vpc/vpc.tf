data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  az_count = length(data.aws_availability_zones.available.names) - 1
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
  availability_zone = local.az_count >= count.index ? data.aws_availability_zones.available.names[count.index] : data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = merge(var.tags,{
               Name = "${var.vpc_name}-public-${count.index}"
               })
}

#resource "aws_subnet" "private_subnet" {
#  count = length(var.cidr_subnet_public)
#  vpc_id = aws_vpc.vpc.id
#  cidr_block = var.cidr_subnet_private[count.index]
#  availability_zone = data.aws_availability_zones.available.names[count.index]
#  map_public_ip_on_launch = true
#  tags = merge(var.tags,{
#               Name = "${var.vpc_name}-private-${count.index}"
#               })
#}
