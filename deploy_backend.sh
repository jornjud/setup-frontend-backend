#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}เริ่มการจัดการ Backend...${NC}"

read -p "กรุณาระบุโฟลเดอร์สำหรับ Backend [Default: ./backend]: " backend_dir
BACKEND_DIR=${backend_dir:-./backend}

if [ ! -d "$BACKEND_DIR" ]; then
    echo -e "${GREEN}กำลังสร้างโฟลเดอร์ Backend: $BACKEND_DIR...${NC}"
    mkdir -p $BACKEND_DIR
fi

echo -e "${GREEN}กำลังสร้างไฟล์ server.js...${NC}"
cat <<EOL > $BACKEND_DIR/server.js
const express = require('express');
const app = express();
const PORT = 3000;

app.use(express.json());

app.get('/', (req, res) => {
    res.send('Welcome to the Backend');
});

app.listen(PORT, () => {
    console.log(\`Server running on http://localhost:\${PORT}\`);
});
EOL

echo -e "${GREEN}กำลังติดตั้ง dependencies...${NC}"
cd $BACKEND_DIR
npm init -y
npm install express

echo -e "${GREEN}จัดการ Backend เสร็จสมบูรณ์!${NC}"