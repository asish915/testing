resource "aws_instance" "vite_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.instance_profile_name
  associate_public_ip_address = true


  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = var.instance_name_tag
  }

  root_block_device {
    encrypted = true
    volume_size = 8
    volume_type = "gp3"
  }

   metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }
}


