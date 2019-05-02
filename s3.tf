resource "aws_s3_bucket" "steve-w-www_distribution" {
  count  = "${length(var.s3bucket-name)}"
  bucket = "steve-w-www-bucket"
  acl    = "public-read"

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::steve-w-www_distribution/*"]
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
