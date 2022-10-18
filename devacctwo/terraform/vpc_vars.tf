variable "vpc" {
 default = {
  vpc1 = {
  vpc_name = "ct1"
  vpc_cidr = "12.1.0.0/24"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  cidr_subnet_public = ["12.1.0.0/25","12.1.0.192/26"]
  cidr_subnet_private = ["12.1.0.16/28"]
  }
  vpc2 = {
  vpc_name = "ct2"
  vpc_cidr = "13.2.0.0/27"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  cidr_subnet_public = ["13.2.0.0/28"]
  cidr_subnet_private = ["13.2.0.16/28"]
  }
 }
}
