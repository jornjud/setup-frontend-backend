#!/bin/bash

# กำหนดสีสำหรับข้อความ
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}เริ่มการติดตั้งโปรแกรมพื้นฐาน...${NC}"

# อัปเดตระบบและแพ็กเกจ
echo -e "${GREEN}กำลังอัปเดตระบบและแพ็กเกจ...${NC}"
sudo apt update && sudo apt upgrade -y

# ติดตั้ง Node.js และ npm
echo -e "${GREEN}กำลังติดตั้ง Node.js และ npm...${NC}"
sudo apt install -y nodejs npm

# ติดตั้ง Nginx
echo -e "${GREEN}กำลังติดตั้ง Nginx...${NC}"
sudo apt install -y nginx

# ติดตั้ง Git
echo -e "${GREEN}กำลังติดตั้ง Git...${NC}"
sudo apt install -y git

# ติดตั้ง unzip
echo -e "${GREEN}กำลังติดตั้ง unzip...${NC}"
sudo apt install -y unzip

# ติดตั้ง htop
echo -e "${GREEN}กำลังติดตั้ง htop (เครื่องมือตรวจสอบระบบ)...${NC}"
sudo apt install -y htop

# ติดตั้ง Docker และ Docker Compose
echo -e "${GREEN}กำลังติดตั้ง Docker และ Docker Compose...${NC}"
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker

# ตรวจสอบการติดตั้ง
echo -e "${GREEN}ตรวจสอบเวอร์ชันที่ติดตั้ง...${NC}"
node -v && npm -v && nginx -v && git --version && docker --version && docker-compose --version

echo -e "${GREEN}การติดตั้งโปรแกรมพื้นฐานเสร็จสมบูรณ์!${NC}"
