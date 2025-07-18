  backend "s3" {
    bucket         = "test-ci-cd-sit-bucket"   # 🔁 Change to your S3 bucket name
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    
  }