# ใช้ Node.js เวอร์ชันล่าสุด
FROM node:18

# ตั้งค่าตำแหน่งการทำงานของแอป
WORKDIR /app

# คัดลอก package.json และติดตั้ง dependencies
COPY package.json package-lock.json ./
RUN npm install

# คัดลอกโค้ดทั้งหมดเข้า container
COPY . .

# Build Next.js
RUN npm run build

# เปิดพอร์ต 3000
EXPOSE 3000

# คำสั่งรันแอป
CMD ["npm", "run", "start"]
