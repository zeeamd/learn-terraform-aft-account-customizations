resource "aws_vpc" "ct2_vpc" {
  cidr_block       = "12.2.0.0/27"
  instance_tenancy = "default"
  tags             = merge(module.tags.map,{
                           Name = "ct2_vpc"
                           })
}

resource "aws_subnet" "pub1" {
  vpc_id     = aws_vpc.ct2_vpc.id
  cidr_block = "12.2.0.0/28"
  tags       = merge(module.tags.map,{
                     Name = "pub1"
                     })
}

resource "aws_subnet" "pri1" {
  vpc_id     = aws_vpc.ct2_vpc.id
  cidr_block = "12.2.0.16/28"
  tags       = merge(module.tags.map,{
                     Name = "pri1"
                     })
}

resource "aws_route_table" "rt_pub1" {
  vpc_id = aws_vpc.ct2_vpc.id
  availability_zone = "us-east-1a"
  tags   = merge(module.tags.map,{
                 Name = "rt_pub1"
                 })
}

resource "aws_route_table" "rt_pri1" {
  vpc_id = aws_vpc.ct2_vpc.id
  availability_zone = "us-east-1b"
  tags   = merge(module.tags.map,{
                 Name = "rt_pri1"
                 })
}

resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.pub1.id
  route_table_id = aws_route_table.rt_pub1.id
}

resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.pri1.id
  route_table_id = aws_route_table.rt_pri1.id
}
