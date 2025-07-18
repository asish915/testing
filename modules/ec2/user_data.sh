#!/bin/bash
yum update -y
amazon-linux-extras install nginx1 -y
systemctl start nginx
systemctl enable nginx

# Install unzip & AWS CLI
yum install -y unzip aws-cli

# Clean nginx root
rm -rf /usr/share/nginx/html/*

# Download and unzip artifact from S3
aws s3 cp s3://${var.frontend_s3_bucket}/vite-app.zip /tmp/vite-app.zip
unzip /tmp/vite-app.zip -d /usr/share/nginx/html/

# Set permissions
chmod -R 755 /usr/share/nginx/html
