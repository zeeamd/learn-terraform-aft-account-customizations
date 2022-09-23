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
  tags = merge(module.tags.map,{
   Name = "test-permission-set-v0"
  })
}

#resource "aws_iam_policy" "sqs-list" {
#    name   = "custom-sqs-list-test-v0"
#    policy = file("files/policies/sqs-list.json")
#}

#resource "aws_ssoadmin_managed_policy_attachment" "cpa1" {
#  instance_arn       = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
#  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
#  permission_set_arn = aws_ssoadmin_permission_set.cps1.arn
#}

resource "aws_ssoadmin_managed_policy_attachment" "cpa1" {
  for_each           = toset(["arn:aws:iam::aws:policy/ReadOnlyAccess"])
  instance_arn       = tolist(data.aws_ssoadmin_instances.cssoai.arns)[0]
  managed_policy_arn = each.key
  permission_set_arn = aws_ssoadmin_permission_set.cps1.arn
}

resource "aws_ssoadmin_permission_set_inline_policy" "cipa1" {
  inline_policy      = file("files/policies/sqs-list.json")
  instance_arn       = aws_ssoadmin_permission_set.cps1.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.cps1.arn
}
