#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังสร้างหรือปรับปรุงโครงสร้างฐานข้อมูล...${NC}"

read -p "กรุณาระบุชื่อฐานข้อมูล [Default: my_database]: " db_name
DB_NAME=${db_name:-my_database}

cat <<EOL > migrate.sql
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
EOL

echo -e "${GREEN}กำลังรันการ Migration...${NC}"
mysql -u root -p $DB_NAME < migrate.sql

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Migration สำเร็จ!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการ Migration!${NC}"
fi

rm migrate.sql