#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังเพิ่มข้อมูลตัวอย่างลงในฐานข้อมูล...${NC}"

read -p "กรุณาระบุชื่อฐานข้อมูล [Default: my_database]: " db_name
DB_NAME=${db_name:-my_database}

cat <<EOL > seed.sql
INSERT INTO users (username, email, password)
VALUES 
('admin', 'admin@example.com', 'admin123'),
('user1', 'user1@example.com', 'password1'),
('user2', 'user2@example.com', 'password2');
EOL

mysql -u root -p $DB_NAME < seed.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}เพิ่มข้อมูลตัวอย่างเสร็จสมบูรณ์!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการเพิ่มข้อมูลตัวอย่าง!${NC}"
fi

rm seed.sql