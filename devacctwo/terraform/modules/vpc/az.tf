data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

output "thisregion" {
  value = data.aws_region.current.name
}

output "thiszonenames" {
  value = data.aws_availability_zones.available.names
}

output "thiszoneids" {
  value = data.aws_availability_zones.available.zone_ids
}
