#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}เลือก Log ที่ต้องการดู...${NC}"
echo "1. Backend Log"
echo "2. Nginx Log"

read -p "กรุณาเลือก (1-2): " choice

case $choice in
    1)
        echo -e "${GREEN}กำลังแสดง Backend Log...${NC}"
        tail -f ./backend/backend.log
        ;;
    2)
        echo -e "${GREEN}กำลังแสดง Nginx Log...${NC}"
        sudo tail -f /var/log/nginx/error.log
        ;;
    *)
        echo -e "${RED}ตัวเลือกไม่ถูกต้อง!${NC}"
        ;;
esac