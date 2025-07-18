resource "aws_codestarconnections_connection" "github_connection" {
  name          = "asish-git-connection"
  provider_type = "GitHub"
}
