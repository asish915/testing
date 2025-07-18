variable "project_name" {
  description = "Project name"
  type        = string
  default     = "vite-react-app"
}

variable "codebuild_role_arn" {
  description = "IAM Role ARN for CodeBuild"
  type        = string
  default     = "arn:aws:iam::068760013706:role/vite-react-app-codebuild-role" # 🔁 Update this
}

variable "s3_bucket" {
  description = "S3 bucket for build artifacts"
  type        = string
  default     = "vite-app-s3-bucket256"
}
