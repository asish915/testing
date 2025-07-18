resource "aws_s3_bucket" "artifact_bucket" {
  bucket = var.bucket_name

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

