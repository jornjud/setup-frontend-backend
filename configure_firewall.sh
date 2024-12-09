#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังตั้งค่า Firewall...${NC}"

sudo ufw allow 'Nginx Full'
sudo ufw allow OpenSSH

if [ $? -eq 0 ]; then
    echo -e "${GREEN}เปิดพอร์ตสำหรับ Nginx และ SSH สำเร็จ!${NC}"
    sudo ufw enable
    echo -e "${GREEN}Firewall เปิดใช้งานเรียบร้อยแล้ว!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการตั้งค่า Firewall!${NC}"
fi