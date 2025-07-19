resource "aws_s3_bucket" "artifact_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = "${var.project_name}-artifact-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.artifact_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "artifact_bucket_block" {
  bucket                  = aws_s3_bucket.artifact_bucket.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "s3_cmk" {
  description         = "CMK for S3 encryption"
  enable_key_rotation = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifact_bucket_encryption" {
  bucket = aws_s3_bucket.artifact_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.s3_cmk.arn
    }
  }
}

resource "aws_s3_bucket" "artifact_bucket_logs" {
  bucket        = "${var.project_name}-artifact-bucket-logs"
  force_destroy = true

  tags = {
    Name        = "${var.project_name}-artifact-bucket-logs"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "artifact_logs_versioning" {
  bucket = aws_s3_bucket.artifact_bucket_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "artifact_logs_encryption" {
  bucket = aws_s3_bucket.artifact_bucket_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.s3_cmk.arn
    }
  }
}

resource "aws_s3_bucket_public_access_block" "artifact_logs_block" {
  bucket                  = aws_s3_bucket.artifact_bucket_logs.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "artifact_bucket_logging" {
  bucket        = aws_s3_bucket.artifact_bucket.id
  target_bucket = aws_s3_bucket.artifact_bucket_logs.id
  target_prefix = "log/"
}




