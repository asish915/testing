variable "project_name" {
  description = "Project name"
  type        = string
  default     = "vite-react-app"
}

variable "codestar_arn" {
  description = "CodeStar Connection ARN"
  type        = string
  default     = "arn:aws:codeconnections:ap-south-1:068760013706:connection/a674b06d-3298-42c1-a353-74c588c26381" # 🔁 Replace
}

variable "repository" {
  description = "GitHub repository"
  type        = string
  default     = "asish915/testing"
}

variable "branch" {
  description = "Branch to track"
  type        = string
  default     = "main"
}

variable "codebuild_project_name" {
  description = "CodeBuild project name"
  type        = string
  default     = "vite-react-app-codebuild"
}

variable "artifact_bucket" {
  description = "S3 bucket for pipeline artifacts"
  type        = string
  default     = "vite-app-s3-bucket256"
}

variable "pipeline_role_arn" {
  description = "IAM Role ARN for CodePipeline"
  type        = string
  default     = "arn:aws:iam::068760013706:role/vite-react-app-codepipeline-role" # 🔁 Replace
}
