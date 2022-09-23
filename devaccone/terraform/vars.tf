variable "iam_policies" {
  default = ["files/policies/sqs-list.json","files/policies/sts-assume-role.json"]  
}
