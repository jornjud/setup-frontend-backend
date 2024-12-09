#!/bin/bash

# กำหนดสีสำหรับข้อความ
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

# ฟังก์ชัน: สร้างโครงสร้างโฟลเดอร์โปรเจค
function create_project_structure() {
    echo -e "${GREEN}เริ่มการสร้างโครงสร้างโปรเจค...${NC}"
    
    # ขอให้ผู้ใช้ระบุชื่อโฟลเดอร์โปรเจค
    read -p "กรุณาระบุชื่อโฟลเดอร์โปรเจค [Default: /var/www/my-project]: " input_project_dir
    PROJECT_DIR=${input_project_dir:-/var/www/my-project}
    FRONTEND_DIR="$PROJECT_DIR/frontend"
    BACKEND_DIR="$PROJECT_DIR/backend"
    DATABASE_DIR="$PROJECT_DIR/database"
    
    # ตรวจสอบและสร้างโฟลเดอร์
    if [ -d "$PROJECT_DIR" ]; then
        echo -e "${RED}โฟลเดอร์ $PROJECT_DIR มีอยู่แล้ว!${NC}"
    else
        echo -e "${GREEN}กำลังสร้างโฟลเดอร์โปรเจคใน: $PROJECT_DIR...${NC}"
        sudo mkdir -p $FRONTEND_DIR $BACKEND_DIR $DATABASE_DIR
        sudo chown $USER:$USER $PROJECT_DIR -R
        echo -e "${GREEN}โครงสร้างโปรเจคสร้างเรียบร้อย:${NC}"
        echo -e "  - Frontend: $FRONTEND_DIR"
        echo -e "  - Backend: $BACKEND_DIR"
        echo -e "  - Database: $DATABASE_DIR"
    fi
}

# เรียกใช้ฟังก์ชันสร้างโครงสร้างโปรเจค
create_project_structure