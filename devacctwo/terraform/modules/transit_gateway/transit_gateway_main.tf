resource "aws_ec2_transit_gateway" "tgw" {
  amazon_side_asn = var.amazon_side_asn
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  vpn_ecmp_support = var.vpn_ecmp_support
  dns_support = var.dns_support
  tags = merge(module.tags.map,{
               Name = var.name
               })
}
