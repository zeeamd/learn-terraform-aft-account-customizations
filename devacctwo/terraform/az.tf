data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_region" "current" {}

output "thisregion" {
  value = data.aws_region.current.name
}

output "thiszonenames" {
  value = data.aws_availability_zones.available.names
}

output "thiszoneids" {
  value = data.aws_availability_zones.available.zone_ids
}
