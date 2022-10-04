#sso permission set module
module "sso_permission_sets" {
  for_each = var.custom-sso-admin-permission-sets
  source = "./modules/sso-permission-sets"
  aws_ssoadmin_permission_set_name = custom-sso-admin-permission-sets.value.aws_ssoadmin_permission_set_name
  aws_ssoadmin_managed_policy_attachments_arn = custom-sso-admin-permission-sets.value.aws_ssoadmin_managed_policy_attachments_arn
  aws_ssoadmin_permission_set_inline_policy_json = custom-sso-admin-permission-sets.value.aws_ssoadmin_permission_set_inline_policy_json
  aws_ssoadmin_permission_set_session_duration = custom-sso-admin-permission-sets.value.aws_ssoadmin_permission_set_session_duration
  tags = merge(module.tags.map,{
   Name = custom-sso-admin-permission-sets.value.aws_ssoadmin_permission_set_name
  })
}
