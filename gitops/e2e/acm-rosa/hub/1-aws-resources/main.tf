resource "aws_s3_bucket" "terraform-state-backend" {
  bucket = "pnminh-terraform-state-backend" # Replace with your desired bucket name
  tags = {
    Name = "pnminh-terraform-state-backend" # Set tags for the bucket as key-value pairs
  }
}

resource "aws_s3_bucket_public_access_block" "terraform-state-backend" {
  bucket = aws_s3_bucket.terraform-state-backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}