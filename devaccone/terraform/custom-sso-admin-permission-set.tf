data "aws_ssoadmin_instances" "cssoai" {}

output "arn" {
  value = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
}

output "identity_store_id" {
  value = tolist(data.aws_ssoadmin_instances.cssoai.identity_store_ids)[0]
}

resource "aws_ssoadmin_permission_set" "cssops" {
  name = "ct2-sso-admin-permission-set"
  instance_arn = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
  tags = merge(module.tags.map,{
   Name = "ct2-sso-admin-permission-set",
   Automation = "AFT-Terraform"
  })
}

resource "aws_ssoadmin_managed_policy_attachment" "cssomp" {
  for_each           = toset(["arn:aws:iam::aws:policy/PowerUserAccess"])
  instance_arn       = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
  managed_policy_arn = each.key
  permission_set_arn = aws_ssoadmin_permission_set.cssops.arn
}

resource "aws_ssoadmin_permission_set_inline_policy" "cssoip" {
  inline_policy      = file("files/policies/custom-sso-admin-user.json")
  instance_arn       = aws_ssoadmin_permission_set.cssops.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.cssops.arn
}
