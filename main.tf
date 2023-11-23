resource "aws_s3_bucket" "project-iac-s3" {
  bucket = var.bucket_name

    tags = merge(tomap(var.s3_tags),{"ApplicationEnvironment" = var.Environment,
    "VersionEnable" = var.versioning,
    "ApplicationOwner" = var.ApplicationOwner,
    "ApplicationTeam" = var.ApplicationTeam,
    "BusinessOwner" = var.BusinessOwner,
    "BusinessTower" = var.BusinessTower})
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_control" {
  bucket = aws_s3_bucket.project-iac-s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_ownership_control]

  bucket = aws_s3_bucket.project-iac-s3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_versioning" {
  count = var.versioning == "Enabled" ? 1 : 0
  bucket = aws_s3_bucket.project-iac-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}


resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.project-iac-s3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
