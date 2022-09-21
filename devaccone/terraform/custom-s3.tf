#This custom file to test account customizations

resource "aws_s3_bucket" "custom-bucket" {
  bucket = "${data.aws_caller_identity.current.account_id}-donotdelete"

  tags = merge(module.tags.map,{
   Name = "${data.aws_caller_identity.current.account_id}-donotdelete"
  })
}
