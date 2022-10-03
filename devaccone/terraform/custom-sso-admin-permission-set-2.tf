#sso permission set module
module "sso_permission_set" {
  source = "./modules/sso-permission-sets"
  aws_ssoadmin_permission_set_name = "ct2-mod-sso-admin-permission-set"
  aws_ssoadmin_managed_policy_attachments_arn = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  aws_ssoadmin_permission_set_inline_policy_json = "custom-sso-admin-user.json"
}
