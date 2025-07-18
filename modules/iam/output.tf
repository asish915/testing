output "codebuild_role_arn" {
  value = aws_iam_role.codebuild_role.arn
}

output "codepipeline_role_arn" {
  value = aws_iam_role.codepipeline_role.arn
}

output "ec2_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_instance_profile.name
}

output "github_codestar_connection_arn" {
  description = "GitHub CodeStar connection ARN"
  value       = aws_codestarconnections_connection.github_connection.arn
}