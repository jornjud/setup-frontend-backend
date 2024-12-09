#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังติดตั้ง SSL Certificate ด้วย Let's Encrypt...${NC}"

read -p "กรุณาระบุชื่อโดเมน [เช่น example.com]: " domain
read -p "กรุณาระบุอีเมลสำหรับการแจ้งเตือน SSL: " email

sudo apt update && sudo apt install -y certbot python3-certbot-nginx

if [ $? -eq 0 ]; then
    echo -e "${GREEN}กำลังตั้งค่า SSL สำหรับโดเมน $domain...${NC}"
    sudo certbot --nginx -d $domain --email $email --agree-tos --non-interactive

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}ติดตั้ง SSL เสร็จสมบูรณ์!${NC}"
    else
        echo -e "${RED}เกิดข้อผิดพลาดในการตั้งค่า SSL!${NC}"
    fi
else
    echo -e "${RED}เกิดข้อผิดพลาดในการติดตั้ง Certbot!${NC}"
fi