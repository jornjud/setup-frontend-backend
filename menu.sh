#!/bin/bash

# กำหนดสีสำหรับข้อความ
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

# ฟังก์ชัน: แสดงเมนูหลัก
function show_main_menu() {
    echo -e "${GREEN}==================== เมนูหลัก ====================${NC}"
    echo "1. ติดตั้งโปรแกรมพื้นฐาน (Install Requirements)"
    echo "2. ติดตั้ง Docker และ Docker Compose"
    echo "3. ตั้งค่าโครงสร้างโปรเจค (Setup Project Structure)"
    echo "4. ตั้งค่าไฟล์ .env"
    echo "5. ติดตั้ง SSL Certificates"
    echo "6. ตั้งค่า Virtual Host สำหรับ Nginx"
    echo "7. จัดการ Frontend"
    echo "8. จัดการ Backend"
    echo "9. ตั้งค่า CI/CD"
    echo "10. จัดการ Nginx"
    echo "11. ตั้งค่า Firewall"
    echo "12. ตั้งค่า Cron Jobs"
    echo "13. จัดการฐานข้อมูล"
    echo "14. ตรวจสอบสถานะระบบ"
    echo "15. ล้างระบบ/ทำความสะอาด"
    echo "16. ดีบักแอปพลิเคชัน"
    echo "17. เริ่มเซิร์ฟเวอร์ Backend"
    echo "18. หยุดเซิร์ฟเวอร์ Backend"
    echo "19. รีสตาร์ท Nginx"
    echo "20. ลบโปรเจคทั้งหมด"
    echo "21. ออกจากโปรแกรม"
    echo -e "=================================================${NC}"
}

# ลูปหลักสำหรับการทำงาน
while true; do
    show_main_menu
    read -p "กรุณาเลือกเมนู (1-21): " CHOICE

    case $CHOICE in
        1) bash install_requirements.sh ;;
        2) bash install_docker.sh ;;
        3) bash setup_project_structure.sh ;;
        4) bash setup_env_variables.sh ;;
        5) bash setup_ssl.sh ;;
        6) bash setup_virtual_host.sh ;;
        7) bash deploy_frontend.sh ;;
        8) bash deploy_backend.sh ;;
        9) bash setup_ci_cd.sh ;;
        10) bash configure_nginx.sh ;;
        11) bash configure_firewall.sh ;;
        12) bash configure_cron_jobs.sh ;;
        13) bash manage_database.sh ;;
        14) bash check_system_status.sh ;;
        15) 
            echo -e "${GREEN}1. ล้าง Cache${NC}"
            echo -e "${GREEN}2. ลบไฟล์ชั่วคราว${NC}"
            echo -e "${GREEN}3. ล้าง Logs${NC}"
            read -p "กรุณาเลือก (1-3): " clean_choice
            case $clean_choice in
                1) bash clear_cache.sh ;;
                2) bash remove_temp_files.sh ;;
                3) bash clear_logs.sh ;;
                *) echo -e "${RED}ตัวเลือกไม่ถูกต้อง!${NC}" ;;
            esac
            ;;
        16) bash debug_application.sh ;;
        17) bash start_application.sh ;;
        18) bash stop_application.sh ;;
        19) bash restart_nginx.sh ;;
        20) bash remove_project.sh ;;
        21)
            echo -e "${GREEN}ขอบคุณที่ใช้งาน!${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}ตัวเลือกไม่ถูกต้อง! กรุณาเลือกใหม่.${NC}"
            ;;
    esac
done