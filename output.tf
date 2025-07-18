output "codebuild_project_name" {
  description = "CodeBuild project name"
  value       = module.codebuild.project_name
}

output "codepipeline_name" {
  description = "CodePipeline name"
  value       = module.codepipeline.pipeline_name
}

output "s3_bucket_name" {
  description = "S3 bucket used in pipeline"
  value       = module.s3.bucket_name
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "codepipeline_role_arn" {
  value = module.iam.codepipeline_role_arn
}

output "codebuild_role_arn" {
  value = module.iam.codebuild_role_arn
}

output "github_codestar_connection_arn" {
  value = module.iam.github_codestar_connection_arn
}