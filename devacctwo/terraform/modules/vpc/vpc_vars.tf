variable "vpc_name" { default = "" }
variable "vpc_cidr" { default = "" }
variable "instance_tenancy" { default = "default" }
variable "enable_dns_support" { default = true }
variable "enable_dns_hostnames" { default = true }
variable "cidr_subnet_public" { default = [] }
variable "cidr_subnet_private" { default = [] }
variable "tags" { default = {} }
