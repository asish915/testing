
module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}

module "codebuild" {
  source = "./modules/codebuild"
}

# module "codedeploy" {
#  source = "./modules/codedeploy"
# }

module "codepipeline" {
  source = "./modules/codepipeline"
}

module "ec2" {
  source = "./modules/ec2"
}

module "codestar" {
  source = "./modules/codestar"
}
