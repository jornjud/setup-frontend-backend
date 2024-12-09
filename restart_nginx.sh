#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังรีสตาร์ท Nginx...${NC}"

sudo systemctl restart nginx

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Nginx รีสตาร์ทเรียบร้อยแล้ว!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการรีสตาร์ท Nginx!${NC}"
fi