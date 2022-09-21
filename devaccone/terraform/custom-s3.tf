#This custom file to test account customizations

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "custom-bucket" {
  bucket = data.aws_caller_identity.current.account_id-DoNotDel

  tags = {
    Name = data.aws_caller_identity.current.account_id
  }
}
