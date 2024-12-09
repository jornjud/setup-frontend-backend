#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังเปิดเครื่องมือตรวจสอบระบบ (htop)...${NC}"

sudo apt install -y htop

if [ $? -eq 0 ]; then
    htop
else
    echo -e "${RED}เกิดข้อผิดพลาดในการติดตั้ง htop!${NC}"
fi