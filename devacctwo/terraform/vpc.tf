module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  subnet_cidr = var.subnet_cidr
  tags = merge(module.tags.map,{
               Name = var.vpc_name
               })
}
