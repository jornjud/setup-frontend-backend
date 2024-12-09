#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังเริ่มเซิร์ฟเวอร์ Backend...${NC}"

read -p "กรุณาระบุโฟลเดอร์ Backend [Default: ./backend]: " backend_dir
BACKEND_DIR=${backend_dir:-./backend}

if [ -d "$BACKEND_DIR" ]; then
    cd $BACKEND_DIR
    echo -e "${GREEN}กำลังรันเซิร์ฟเวอร์ใน background...${NC}"
    nohup npm start &> backend.log &
    echo -e "${GREEN}เซิร์ฟเวอร์ Backend เริ่มทำงานแล้ว!${NC}"
    echo -e "${GREEN}Log ถูกบันทึกไว้ที่ $BACKEND_DIR/backend.log${NC}"
else
    echo -e "${RED}ไม่พบโฟลเดอร์ Backend: $BACKEND_DIR${NC}"
fi