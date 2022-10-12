resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(var.tags,{
               Name = var.vpc_name
               })
}

resource "aws_subnet" "public_subnet" {
  count = 2
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = merge(var.tags,{
               Name = "${var.vpc_name}-public-${count.index}"
               })
}
