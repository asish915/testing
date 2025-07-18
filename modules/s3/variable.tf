variable "bucket_name" {
  description = "S3 bucket name for Vite app artifacts"
  type        = string
  default     = "vite-app-s3-bucket256" # 🔁 Must be globally unique
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "vite-react-app"
}
