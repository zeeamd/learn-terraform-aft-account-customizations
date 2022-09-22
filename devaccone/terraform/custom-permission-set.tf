data "aws_ssoadmin_instances" "cssoai" {}

output "arn" {
  value = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
}

output "identity_store_id" {
  value = tolist(data.aws_ssoadmin_instances.cssoai.identity_store_ids)[0]
}

resource "aws_ssoadmin_permission_set" "cps1" {
  name = "test-permission-set-v0"
  instance_arn = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
  tags = module.tags.map
}
