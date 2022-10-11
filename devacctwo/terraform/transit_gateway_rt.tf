resource "aws_ec2_transit_gateway_route_table" "ct2_vpc_attachment_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.ct2_tgw.id
}

resource "aws_ec2_transit_gateway_route_table_association" "ct2_tgw_rt_associate" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.ct2_vpc_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.ct2_vpc_attachment_rt.id
}
