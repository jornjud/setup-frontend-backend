#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # ไม่มีสี

echo -e "${GREEN}เริ่มการจัดการ Frontend...${NC}"

read -p "กรุณาระบุโฟลเดอร์สำหรับ Frontend [Default: ./frontend]: " frontend_dir
FRONTEND_DIR=${frontend_dir:-./frontend}

if [ ! -d "$FRONTEND_DIR" ]; then
    echo -e "${GREEN}กำลังสร้างโฟลเดอร์ Frontend: $FRONTEND_DIR...${NC}"
    mkdir -p $FRONTEND_DIR
fi

echo -e "${GREEN}กำลังสร้างไฟล์ HTML...${NC}"
cat <<EOL > $FRONTEND_DIR/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Frontend</title>
</head>
<body>
    <h1>Welcome to the Frontend</h1>
</body>
</html>
EOL

echo -e "${GREEN}กำลังสร้างไฟล์ CSS...${NC}"
cat <<EOL > $FRONTEND_DIR/styles.css
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
}
EOL

echo -e "${GREEN}กำลังสร้างไฟล์ JavaScript...${NC}"
cat <<EOL > $FRONTEND_DIR/script.js
document.addEventListener('DOMContentLoaded', () => {
    console.log('Frontend script loaded');
});
EOL

echo -e "${GREEN}จัดการ Frontend เสร็จสมบูรณ์!${NC}"