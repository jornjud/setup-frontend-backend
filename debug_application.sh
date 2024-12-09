#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}เลือกประเภทการดีบัก...${NC}"
echo "1. ตรวจสอบสถานะการเชื่อมต่ออินเทอร์เน็ต"
echo "2. ตรวจสอบสถานะเซิร์ฟเวอร์ Nginx"
echo "3. ตรวจสอบสถานะเซิร์ฟเวอร์ Backend"
echo "4. ตรวจสอบพอร์ตที่ใช้งาน"

read -p "กรุณาเลือก (1-4): " debug_choice

case $debug_choice in
    1)
        echo -e "${GREEN}กำลังตรวจสอบการเชื่อมต่ออินเทอร์เน็ต...${NC}"
        ping -c 4 google.com
        ;;
    2)
        echo -e "${GREEN}กำลังตรวจสอบสถานะ Nginx...${NC}"
        sudo systemctl status nginx
        ;;
    3)
        echo -e "${GREEN}กำลังตรวจสอบสถานะเซิร์ฟเวอร์ Backend...${NC}"
        pgrep -af "node"
        ;;
    4)
        echo -e "${GREEN}กำลังตรวจสอบพอร์ตที่ใช้งาน...${NC}"
        sudo netstat -tulnp
        ;;
    *)
        echo -e "${RED}ตัวเลือกไม่ถูกต้อง!${NC}"
        ;;
esac