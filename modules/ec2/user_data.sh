#!/bin/bash
# Update the system and install required packages
yum update -y
amazon-linux-extras install nginx1 -y
yum install -y unzip aws-cli

# Enable and start NGINX
systemctl enable nginx
systemctl start nginx

# Replace the default NGINX configuration with our custom config
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

# Clean the existing content at the NGINX root
rm -rf /usr/share/nginx/html/*

# Download the Vite app artifact (vite-app.zip) from S3
aws s3 cp s3://vite-app-s3-bucket256/vite-app.zip /tmp/vite-app.zip

# Unzip the artifact into the NGINX root folder
unzip -o /tmp/vite-app.zip -d /usr/share/nginx/html/

# If the ZIP contains a nested "dist" directory, move its content to the root
if [ -d "/usr/share/nginx/html/dist" ]; then
  mv /usr/share/nginx/html/dist/* /usr/share/nginx/html/
  rm -rf /usr/share/nginx/html/dist
fi

# Set ownership and permissions so that the nginx process can read the files
chown -R nginx:nginx /usr/share/nginx/html
chmod -R 755 /usr/share/nginx/html

# Restart NGINX to apply the new configuration
systemctl restart nginx

