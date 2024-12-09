#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังสร้างไฟล์ .env...${NC}"

read -p "กรุณาระบุชื่อไฟล์ .env [Default: ./backend/.env]: " env_file
ENV_FILE=${env_file:-./backend/.env}

cat <<EOL > $ENV_FILE
# ตัวอย่างไฟล์ .env
NODE_ENV=development
PORT=3000
DATABASE_HOST=localhost
DATABASE_USER=root
DATABASE_PASSWORD=password
DATABASE_NAME=my_database
EOL

if [ $? -eq 0 ]; then
    echo -e "${GREEN}สร้างไฟล์ .env เสร็จสมบูรณ์: $ENV_FILE${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการสร้างไฟล์ .env!${NC}"
fi