#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังหยุดเซิร์ฟเวอร์ Backend...${NC}"
pkill -f "node"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}เซิร์ฟเวอร์ Backend หยุดทำงานแล้ว!${NC}"
else
    echo -e "${RED}ไม่พบเซิร์ฟเวอร์ Backend ที่กำลังทำงาน!${NC}"
fi