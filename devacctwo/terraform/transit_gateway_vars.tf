variable "name" { default = "ct2_tgw" }
variable "amazon_side_asn" { default = null }
variable "auto_accept_shared_attachments" { default = "enable" }
variable "default_route_table_association" { default = "disable" }
variable "default_route_table_propagation" { default = "disable" }
variable "dns_support" { default = "enable" }
variable "vpn_ecmp_support" { default = "enable" }
