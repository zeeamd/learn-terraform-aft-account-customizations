module "vpc" {
  for_each = var.vpc
  source = "./modules/vpc"
  vpc_name = each.value["vpc_name"]
  vpc_cidr = each.value["vpc_cidr"]
  instance_tenancy = each.value["instance_tenancy"]
  enable_dns_support = each.value["enable_dns_support"]
  enable_dns_hostnames = each.value["enable_dns_hostnames"]
  cidr_subnet_public = each.value["cidr_subnet_public"]
  cidr_subnet_private = each.value["cidr_subnet_private"]
  tgw_id = module.transit_gateway.tgw_id
  tags = module.tags.map
}
