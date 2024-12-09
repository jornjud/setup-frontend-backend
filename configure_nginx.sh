#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}เริ่มการตั้งค่า Nginx...${NC}"

read -p "กรุณาระบุชื่อโดเมนหรือ IP [Default: localhost]: " domain_name
DOMAIN_NAME=${domain_name:-localhost}

NGINX_CONF="/etc/nginx/sites-available/my_project"
FRONTEND_DIR="/var/www/my-project/frontend"

echo -e "${GREEN}กำลังสร้างไฟล์คอนฟิก Nginx...${NC}"
sudo bash -c "cat > $NGINX_CONF" <<EOL
server {
    listen 80;
    server_name $DOMAIN_NAME;

    root $FRONTEND_DIR;

    location / {
        try_files \$uri /index.html;
    }

    location /api/ {
        proxy_pass http://localhost:3000/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOL

sudo ln -sf $NGINX_CONF /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl restart nginx

echo -e "${GREEN}ตั้งค่า Nginx เสร็จสมบูรณ์!${NC}"