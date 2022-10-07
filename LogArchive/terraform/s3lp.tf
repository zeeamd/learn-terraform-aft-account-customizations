resource "aws_s3control_bucket_lifecycle_configuration" "s3lcr" {
  bucket = "arn:aws:s3:::deleteme07102022"

  rule {
    expiration {
      days = 30
    }

    filter {
      prefix = "logs/"
    }

    id = "logs"
  }
}
