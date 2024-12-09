#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังตั้งค่า CI/CD...${NC}"

read -p "กรุณาระบุชื่อ Repository Git [URL]: " git_repo
read -p "กรุณาระบุโฟลเดอร์ปลายทาง [Default: /var/www/my_project]: " project_dir
PROJECT_DIR=${project_dir:-/var/www/my_project}

if [ ! -d "$PROJECT_DIR" ]; then
    echo -e "${GREEN}กำลังโคลน Repository...${NC}"
    git clone $git_repo $PROJECT_DIR

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}โคลน Repository เสร็จสมบูรณ์!${NC}"
        cd $PROJECT_DIR
        echo -e "${GREEN}กำลังติดตั้ง Dependencies...${NC}"
        npm install
        echo -e "${GREEN}การตั้งค่า CI/CD เสร็จสมบูรณ์!${NC}"
    else
        echo -e "${RED}เกิดข้อผิดพลาดในการโคลน Repository!${NC}"
    fi
else
    echo -e "${RED}โฟลเดอร์ $PROJECT_DIR มีอยู่แล้ว! กรุณาลบก่อนหากต้องการโคลนใหม่${NC}"
fi