resource "aws_codebuild_project" "vite_app" {
  name          = "${var.project_name}-codebuild"
  description   = "Builds the Vite + React app"
  service_role  = var.codebuild_role_arn
  build_timeout = 10

  artifacts {
    type = "S3"
    location = var.s3_bucket
    packaging = "ZIP"
    path = "build"
    name = "vite-app.zip"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:7.0"
    type                        = "LINUX_CONTAINER"
    privileged_mode             = false
  }

  source {
    type      = "GITHUB"
    location  = "https://github.com/asish915/testing"
    buildspec = "buildspec.yaml"
  }

  tags = {
    Name = "${var.project_name}-codebuild"
  }
}
