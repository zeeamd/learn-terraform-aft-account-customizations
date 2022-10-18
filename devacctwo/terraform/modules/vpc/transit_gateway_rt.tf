resource "aws_ec2_transit_gateway_route_table" "vpc_attachment_rt" {
  transit_gateway_id = var.tgw_id
  tags = merge(var.tags,{
               Name = "${var.vpc_name}_rt"
              })
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_associate" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.vpc_attachment_rt.id
}
