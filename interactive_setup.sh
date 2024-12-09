#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}==================== การตั้งค่าโปรเจค ====================${NC}"
echo -e "${GREEN}โปรแกรมนี้จะช่วยคุณตั้งค่าข้อมูลที่จำเป็นสำหรับการสร้าง Frontend และ Backend${NC}"
echo -e "${GREEN}กรุณาตอบคำถามเพื่อดำเนินการต่อ${NC}"
echo -e "============================================================="

# ขอชื่อโฟลเดอร์โปรเจค
read -p "กรุณาระบุชื่อโฟลเดอร์โปรเจค [Default: /var/www/my_project]: " project_dir
PROJECT_DIR=${project_dir:-/var/www/my_project}

# ขอ IP Address และพอร์ตสำหรับ Backend
read -p "กรุณาระบุ IP Address สำหรับ Backend [Default: 127.0.0.1]: " backend_ip
BACKEND_IP=${backend_ip:-127.0.0.1}
read -p "กรุณาระบุพอร์ตสำหรับ Backend [Default: 3000]: " backend_port
BACKEND_PORT=${backend_port:-3000}

# ขอชื่อฐานข้อมูลและรหัสผ่าน
read -p "กรุณาระบุชื่อฐานข้อมูล [Default: my_database]: " db_name
DB_NAME=${db_name:-my_database}
read -p "กรุณาระบุชื่อผู้ใช้ฐานข้อมูล [Default: root]: " db_user
DB_USER=${db_user:-root}
read -sp "กรุณาระบุรหัสผ่านฐานข้อมูล: " db_password
echo ""

# ขอชื่อโดเมนสำหรับ Frontend
read -p "กรุณาระบุโดเมนสำหรับ Frontend [Default: example.com]: " frontend_domain
FRONTEND_DOMAIN=${frontend_domain:-example.com}

# บันทึกข้อมูลในไฟล์ `.env`
ENV_FILE="$PROJECT_DIR/.env"
echo -e "${GREEN}กำลังบันทึกข้อมูลในไฟล์ .env...${NC}"
mkdir -p $PROJECT_DIR
cat <<EOL > $ENV_FILE
# Environment Variables
PROJECT_DIR=$PROJECT_DIR
BACKEND_IP=$BACKEND_IP
BACKEND_PORT=$BACKEND_PORT
DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
FRONTEND_DOMAIN=$FRONTEND_DOMAIN
EOL

echo -e "${GREEN}บันทึกข้อมูลเสร็จสมบูรณ์!${NC}"
echo -e "ไฟล์ .env ถูกบันทึกไว้ที่: $ENV_FILE"
echo -e "============================================================="

# แนะนำขั้นตอนถัดไป
echo -e "${GREEN}ขั้นตอนถัดไปที่แนะนำ:${NC}"
echo "1. สร้างโครงสร้างโปรเจค: รัน 'bash setup_project_structure.sh'"
echo "2. ติดตั้งโปรแกรมพื้นฐาน: รัน 'bash install_requirements.sh'"
echo "3. ตั้งค่า Nginx: รัน 'bash configure_nginx.sh'"
echo "4. เพิ่ม SSL: รัน 'bash setup_ssl.sh'"
echo "5. เริ่มเซิร์ฟเวอร์ Backend: รัน 'bash start_application.sh'"

echo -e "${GREEN}โปรเจคของคุณพร้อมสำหรับการตั้งค่าเพิ่มเติมแล้ว!${NC}"