resource "aws_ec2_transit_gateway_route_table" "vpc_attachment_rt" {
  transit_gateway_id = "tgw-048cad44b48542dec"
}

resource "aws_ec2_transit_gateway_route_table_association" "tgw_rt_associate" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.vpc_attachment_rt.id
}
