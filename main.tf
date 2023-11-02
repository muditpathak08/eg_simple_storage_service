resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

    tags = merge(tomap(var.tags),{Name = "var.bucket_name"})
}

resource "aws_s3_bucket_acl" "example" {
  count = var.versioning == "Enabled" ? 1 : 0
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  count = var.versioning == "Enabled" ? 1 : 0
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}