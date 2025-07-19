resource "aws_s3_bucket" "artifact_bucket" {
  bucket = var.bucket_name
  force_destroy = true    # Automatically Empty the bucket and destroy it

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

