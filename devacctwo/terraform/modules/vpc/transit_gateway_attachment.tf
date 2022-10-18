resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  subnet_ids         = aws_subnet.public_subnet.*.id
  ##transit_gateway_id = aws_ec2_transit_gateway.ct2_tgw.id
  transit_gateway_id = "tgw-048cad44b48542dec"
  vpc_id             = aws_vpc.vpc.id
  transit_gateway_default_route_table_association = false
  transit_gateway_default_route_table_propagation = false
  tags               = merge(module.tags.map,{
                             Name = "${var.vpc_name}_attachment"
                             })
}
