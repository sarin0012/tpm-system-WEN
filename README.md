# TPM Management System — Setup Guide
## คู่มือติดตั้ง (วิธีนำขึ้น Google Apps Script)

---

## ขั้นตอนที่ 1: สร้าง Google Apps Script Project

1. เปิดเบราว์เซอร์ ไปที่ → **https://script.google.com**
2. คลิก **"New project"** (มุมบนซ้าย)
3. เปลี่ยนชื่อโปรเจกต์ (คลิกที่ "Untitled project") → **"TPM Management System"**

---

## ขั้นตอนที่ 2: วางโค้ด

### 2.1 วาง Code.gs
1. คลิกที่ไฟล์ **Code.gs** (ด้านซ้ายมือ)
2. ลบโค้ดเดิมออกทั้งหมด
3. เปิดไฟล์ `Code.gs` ใน Folder `D:\TPM_System\`
4. Copy ทั้งหมด → Paste ลงใน Google Apps Script

### 2.2 สร้างไฟล์ Index.html
1. คลิก **➕ (เครื่องหมายบวก)** ด้านซ้ายข้าง Files
2. เลือก **"HTML"**
3. ตั้งชื่อว่า **"Index"** (ห้ามใส่ .html)
4. เปิดไฟล์ `Index.html` ใน Folder `D:\TPM_System\`
5. Copy ทั้งหมด → Paste แทนที่ทั้งหมด

---

## ขั้นตอนที่ 3: Deploy เป็น Web App

1. คลิก **"Deploy"** → **"New deployment"**
2. คลิกไอคอน ⚙️ ข้างๆ "Select type" → เลือก **"Web app"**
3. ตั้งค่า:
   - **Description**: TPM System v1.0
   - **Execute as**: Me (your Google account)
   - **Who has access**: Anyone with Google Account *(หรือ Anyone สำหรับทีม)*
4. คลิก **"Deploy"**
5. **อนุญาต Permissions** ที่ขอ (ครั้งแรกจะถามสิทธิ์ Sheets + Drive)
6. **Copy URL** ที่ได้ → นำไปแชร์ให้ทีม ✅

---

## ขั้นตอนที่ 4: Setup ครั้งแรก (Auto)

เมื่อเปิด URL ครั้งแรก ระบบจะ:
- ✅ สร้าง Google Spreadsheet ชื่อ **"TPM System — Database"**
- ✅ สร้าง Google Drive Folder ชื่อ **"TPM_System"** พร้อม Subfolder ทั้งหมด
- ✅ สร้าง Sheet ทุกอัน (Molds, Machines, TPM_Plans, Issues, Stock_Parts...)
- ✅ เพิ่มคุณเป็น Admin อัตโนมัติ

> **หมายเหตุ**: ถ้าระบบไม่ Setup อัตโนมัติ ให้ไปที่ Apps Script Editor → ฟังก์ชัน `setup()` → กด Run ▶️

---

## โครงสร้างไฟล์ (Files)

```
D:\TPM_System\
├── Code.gs           ← Backend (วางใน Apps Script)
├── Index.html        ← Frontend SPA (วางใน Apps Script)
├── appsscript.json   ← Manifest (ไม่ต้องวาง แต่ใช้อ้างอิง)
└── README.md         ← คู่มือนี้
```

---

## Features ที่มีในระบบ

| หน้า | ฟีเจอร์ |
|------|---------|
| 🏠 Dashboard | Stats, กราฟ TPM/Issues, แจ้งเตือน Low Stock & Overdue |
| 🧩 Mold | ลงทะเบียน, แก้ไข, อัพโหลดรูป |
| 🏭 Machine | ลงทะเบียน, แก้ไข, อัพโหลดรูป |
| 🔧 TPM | วางแผนรายปี (Bulk), ปฏิทินรายเดือน, บันทึกผล + Checklist + รูป |
| 🚨 Issues | แจ้งปัญหา + รูปหลายรูป, ติดตามสถานะ, ปิดงาน + รูปเสร็จ |
| 📦 Stock | คลัง Part, รับ/เบิก, แจ้งเตือน Low Stock |
| 📊 Reports | Export CSV, เปิด Google Sheets, KPI Summary |
| 👥 Users | เพิ่ม/แก้ไข ผู้ใช้ + บทบาท |

---

## User Roles

| Role | สิทธิ์ |
|------|-------|
| **Admin** | ทุกอย่าง + จัดการ Users |
| **Technician** | ลงทะเบียน, TPM, Issues, Stock |
| **Viewer** | ดูอย่างเดียว |

---

## Google Drive Structure (Auto-created)

```
📁 TPM_System/
├── 📁 Molds/
├── 📁 Machines/
├── 📁 TPM_Records/
└── 📁 Issues/
    ├── 📁 Before/
    └── 📁 After/
```

---

*Version 1.0 | Built with Google Apps Script + Google Sheets + Google Drive*
