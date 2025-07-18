#!/bin/bash
# Update and install nginx
yum update -y
amazon-linux-extras install nginx1 -y
yum install -y unzip aws-cli

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Replace the default nginx configuration
cat <<EOF > /etc/nginx/nginx.conf
user nginx;
worker_processes auto;

events {}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/css text/xml text/javascript application/javascript application/x-javascript application/json application/xml;
    gzip_disable "MSIE [1-6]\\.";

    server {
        listen 80;
        server_name localhost;

        root /usr/share/nginx/html;
        index index.html;

        location / {
            try_files \$uri \$uri/ /index.html;
        }

        location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2|ttf|eot|otf)$ {
            expires 30d;
            access_log off;
        }

        error_page 404 /index.html;
    }
}
EOF

# Clean existing content
rm -rf /usr/share/nginx/html/*

# Download and extract frontend app from S3
aws s3 cp s3://${var.frontend_s3_bucket}/vite-app.zip /tmp/vite-app.zip
unzip /tmp/vite-app.zip -d /usr/share/nginx/html/

# Set permissions
chmod -R 755 /usr/share/nginx/html

# Restart nginx to apply new config
systemctl restart nginx
