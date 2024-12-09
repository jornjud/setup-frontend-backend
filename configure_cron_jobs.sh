#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังตั้งค่า Cron Jobs...${NC}"

read -p "กรุณาระบุคำสั่งสำหรับ Cron Job (เช่น backup หรือ script.sh): " cron_command
read -p "กรุณาระบุเวลาในการรัน Cron Job [Default: 0 3 * * *]: " cron_time
CRON_TIME=${cron_time:-"0 3 * * *"}

(crontab -l 2>/dev/null; echo "$CRON_TIME $cron_command") | crontab -

if [ $? -eq 0 ]; then
    echo -e "${GREEN}เพิ่ม Cron Job เสร็จสมบูรณ์!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการเพิ่ม Cron Job!${NC}"
fi