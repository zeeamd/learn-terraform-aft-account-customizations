resource "aws_ec2_transit_gateway" "ct2_tgw" {
  default_route_table_association = "disable"
  default_route_table_propagation = "disable"
  auto_accept_shared_attachments  = "enable"
  multicast_support               = "enable"
  vpn_ecmp_support                = "enable"
  dns_support                     = "enable"
  tags                            = merge(module.tags.map,{
                                         Name = "ct2_tgw"
                                         })
}
