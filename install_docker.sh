#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}กำลังติดตั้ง Docker และ Docker Compose...${NC}"

sudo apt update && sudo apt install -y docker.io docker-compose

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Docker และ Docker Compose ติดตั้งเสร็จสมบูรณ์!${NC}"
    sudo systemctl start docker
    sudo systemctl enable docker
    echo -e "${GREEN}Docker พร้อมใช้งานแล้ว!${NC}"
else
    echo -e "${RED}เกิดข้อผิดพลาดในการติดตั้ง Docker!${NC}"
fi