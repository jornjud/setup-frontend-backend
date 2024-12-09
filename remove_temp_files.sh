#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังลบไฟล์ชั่วคราว...${NC}"

sudo rm -rf /tmp/*

if [ $? -eq 0 ]; then
    echo -e "${GREEN}ลบไฟล์ชั่วคราวเสร็จสมบูรณ์!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการลบไฟล์ชั่วคราว!${NC}"
fi