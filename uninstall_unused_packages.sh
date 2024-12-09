#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังลบแพ็กเกจที่ไม่ได้ใช้งาน...${NC}"

sudo apt autoremove -y

if [ $? -eq 0 ]; then
    echo -e "${GREEN}ลบแพ็กเกจที่ไม่ได้ใช้งานเสร็จสมบูรณ์!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการลบแพ็กเกจ!${NC}"
fi