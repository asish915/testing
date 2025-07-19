terraform {
  backend "s3" {
    bucket  = "test-ci-cd-sit-bucket" # ✅ Replace with your actual bucket name
    key     = "state/terraform.tfstate"
    region  = "ap-south-1" # ✅ Use your AWS region (e.g., ap-south-1 for Mumbai)
    encrypt = true
  }
}