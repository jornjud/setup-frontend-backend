#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังล้าง Cache ระบบ...${NC}"

sudo sync; sudo sysctl -w vm.drop_caches=3

if [ $? -eq 0 ]; then
    echo -e "${GREEN}ล้าง Cache เสร็จสมบูรณ์!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการล้าง Cache!${NC}"
fi