variable "custom-sso-admin-permission-sets" { 
 default = {
  ps1 = {
  aws_ssoadmin_permission_set_name = "ct-sso-admin-permission-set"
  aws_ssoadmin_managed_policy_attachments_arn = ["arn:aws:iam::aws:policy/AWSSSOMemberAccountAdministrator"]
  aws_ssoadmin_permission_set_inline_policy_json = ""
  aws_ssoadmin_permission_set_session_duration = "PT8H"
  }  
  ps2 = {
  aws_ssoadmin_permission_set_name = "ct-compliance-audit-permission-set"
  aws_ssoadmin_managed_policy_attachments_arn = ["arn:aws:iam::aws:policy/PowerUserAccess"]
  aws_ssoadmin_permission_set_inline_policy_json = "custom-compliance-audit.json"
  aws_ssoadmin_permission_set_session_duration = ""
  }  
 }
}
