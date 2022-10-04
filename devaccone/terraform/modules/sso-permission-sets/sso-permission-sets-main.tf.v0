data "aws_ssoadmin_instances" "ctssoai" {}

output "arn" {
  value = tolist(data.aws_ssoadmin_instances.ctssoai.arns)[0]
}

output "identity_store_id" {
  value = tolist(data.aws_ssoadmin_instances.ctssoai.identity_store_ids)[0]
}

resource "aws_ssoadmin_permission_set" "ctssops" {
  name = var.aws_ssoadmin_permission_set_name
  instance_arn = tolist(data.aws_ssoadmin_instances.ctssoai.arns)[0]
  session_duration = var.aws_ssoadmin_permission_set_session_duration
  tags = var.tags
}

resource "aws_ssoadmin_managed_policy_attachment" "ctssomp" {
  for_each           = toset(var.aws_ssoadmin_managed_policy_attachments_arn)
  instance_arn       = tolist(data.aws_ssoadmin_instances.ctssoai.arns)[0]
  managed_policy_arn = each.key
  permission_set_arn = aws_ssoadmin_permission_set.ctssops.arn
}

resource "aws_ssoadmin_permission_set_inline_policy" "ctssoip" {
  inline_policy      = file("files/policies/${var.aws_ssoadmin_permission_set_inline_policy_json}")
  instance_arn       = aws_ssoadmin_permission_set.ctssops.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.ctssops.arn
}
