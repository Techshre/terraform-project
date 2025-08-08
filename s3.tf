resource "aws_s3_bucket" "my_bucket" {
  bucket = "demo-bucket ${random_id.rand_id.hex}"

}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.my_bucket.bucket
  source = "./index.html"
  key    = "index.html"
}
resource "aws_s3_object" "styles_css" {
  bucket = aws_s3_bucket.my_bucket.bucket
  source = "./styles.css"
  key    = "styles.css"
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
