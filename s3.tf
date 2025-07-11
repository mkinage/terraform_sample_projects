#Bucket Creation
resource "aws_s3_bucket" "tfwebbucket321" {
  bucket = "tfwebbucket321"

  tags = {
    Name        = "tfwebbucket321"
    Environment = "Dev"

  }
}
#S3 WebSite Configuration
resource "aws_s3_bucket_website_configuration" "web_config" {
  bucket = aws_s3_bucket.tfwebbucket321.id
  index_document {
    suffix = "index.html"

  }
  error_document {
    key = "error.html"
  }

}

#Upload index.html
resource "aws_s3_object" "indexhtml" {
  bucket       = "tfwebbucket321"
  key          = "index.html"
  content      = "<h1>Hello, world</h1>"
  content_type = "text/html"
}
resource "aws_s3_bucket_policy" "web_policy" {
  bucket     = aws_s3_bucket.tfwebbucket321.id
  policy     = file("s3policy.json")
  depends_on = [aws_s3_bucket.tfwebbucket321]

}


## WebACLs
resource "aws_s3_bucket_public_access_block" "pubicaccess" {
  bucket                  = aws_s3_bucket.tfwebbucket321.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false


}
