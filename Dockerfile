# ใช้ Node.js เวอร์ชัน 18
FROM node:18

# ตั้งค่าตำแหน่งการทำงานของแอป
WORKDIR /app

# คัดลอก package.json และ lock file (ที่อยู่ด้านนอก)
COPY package.json package-lock.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกโค้ดทั้งหมดเข้า container
COPY . .  # ← คัดลอกโค้ดทั้งหมดรวม my-app

# สร้าง build
RUN npm run build --prefix my-app

# เปิดพอร์ต 3000
EXPOSE 3000

# คำสั่งรันแอป
CMD ["npm", "run", "start", "--prefix", "my-app"]
