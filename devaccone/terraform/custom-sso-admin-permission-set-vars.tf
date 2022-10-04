variable "custom-sso-admin-permission-sets" { 
 default = {
  ps1 = {
  aws_ssoadmin_permission_set_name = "ct-sso-admin-permission-set"
  aws_ssoadmin_managed_policy_attachments_arn = [""]
  aws_ssoadmin_permission_set_inline_policy_json = ""
  aws_ssoadmin_permission_set_session_duration = "PT12H"
  }  
 }
}
