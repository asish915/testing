variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f7016196fac4fd5d"  # Amazon Linux 2 in ap-south-1
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name for SSH"
  type        = string
  default     = "DevOps_mumbai1"  # Change to your actual key
}

variable "subnet_id" {
  description = "Subnet ID to launch EC2 instance"
  type        = string
  default     = "subnet-0e7598753b990a358"  # Change accordingly
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = ["sg-0b6daf7dd174071b8"]  # Change accordingly
}

variable "instance_profile_name" {
  description = "IAM Instance profile name for EC2"
  type        = string
  default     = "vite-react-app-ec2-profile"
}

variable "instance_name_tag" {
  description = "Tag Name for EC2 instance"
  type        = string
  default     = "vite-ec2-instance"
}

variable "frontend_s3_bucket" {
  description = "S3 bucket containing the Vite app"
  type        = string
  default     = "vite-app-s3-bucket256" # 🔁 Change if needed
}

