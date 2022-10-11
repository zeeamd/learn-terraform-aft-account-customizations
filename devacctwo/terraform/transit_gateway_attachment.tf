resource "aws_ec2_transit_gateway_vpc_attachment" "ct2_vpc_attachment" {
  subnet_ids         = [aws_subnet.pub1.id,aws_subnet.pri1.id]
  transit_gateway_id = aws_ec2_transit_gateway.ct2_tgw.id
  vpc_id             = aws_vpc.ct2_vpc.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = merge(module.tags.map,{
                             Name = "ct2_vpc_attachment"
                             })
}
