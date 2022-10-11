resource "aws_ec2_transit_gateway" "tgw" {
  default_route_table_association = var.default_route_table_association
  default_route_table_propagation = var.default_route_table_propagation
  auto_accept_shared_attachments = var.auto_accept_shared_attachments
  vpn_ecmp_support = var.vpn_ecmp_support
  dns_support = var.dns_support
}
