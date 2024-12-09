#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # ไม่มีสี

function backup_database() {
    read -p "กรุณาระบุชื่อฐานข้อมูลที่จะสำรอง: " db_name
    backup_file="${db_name}_backup_$(date +%Y%m%d%H%M%S).sql"
    echo -e "${GREEN}กำลังสำรองฐานข้อมูล $db_name...${NC}"
    mysqldump -u root -p $db_name > $backup_file
    echo -e "${GREEN}สำรองข้อมูลเสร็จสิ้น! ไฟล์: $backup_file${NC}"
}

function restore_database() {
    read -p "กรุณาระบุชื่อไฟล์สำรอง (.sql): " backup_file
    read -p "กรุณาระบุชื่อฐานข้อมูลที่จะกู้คืน: " db_name
    echo -e "${GREEN}กำลังกู้คืนฐานข้อมูล $db_name จากไฟล์ $backup_file...${NC}"
    mysql -u root -p $db_name < $backup_file
    echo -e "${GREEN}กู้คืนฐานข้อมูลเสร็จสิ้น!${NC}"
}

function seed_database() {
    echo -e "${GREEN}กำลังเพิ่มข้อมูลตัวอย่างลงในฐานข้อมูล...${NC}"
    # เพิ่ม SQL ตัวอย่าง
    echo -e "${GREEN}เพิ่มข้อมูลตัวอย่างเสร็จสิ้น!${NC}"
}

function optimize_database() {
    echo -e "${GREEN}กำลังปรับปรุงประสิทธิภาพฐานข้อมูล...${NC}"
    # ตัวอย่างคำสั่ง SQL เช่น ANALYZE TABLE
    echo -e "${GREEN}ปรับปรุงประสิทธิภาพเสร็จสิ้น!${NC}"
}

echo -e "${GREEN}จัดการฐานข้อมูล: เลือกการทำงาน...${NC}"
echo "1. สำรองฐานข้อมูล"
echo "2. กู้คืนฐานข้อมูล"
echo "3. เพิ่มข้อมูลตัวอย่าง"
echo "4. ปรับปรุงประสิทธิภาพฐานข้อมูล"
read -p "กรุณาเลือก (1-4): " choice

case $choice in
    1) backup_database ;;
    2) restore_database ;;
    3) seed_database ;;
    4) optimize_database ;;
    *) echo -e "${RED}ตัวเลือกไม่ถูกต้อง!${NC}" ;;
esac