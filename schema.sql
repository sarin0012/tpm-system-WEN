-- ============================================================
--  TPM SYSTEM DATABASE SCHEMA FOR SUPABASE
--  คัดลอกข้อความทั้งหมดนี้ไปวางใน Supabase SQL Editor แล้วกด Run
-- ============================================================

-- 1. MOLDS (ตารางแม่พิมพ์)
CREATE TABLE IF NOT EXISTS molds (
  "ID" TEXT PRIMARY KEY,
  "Name" TEXT NOT NULL,
  "AssetNo" TEXT,
  "Vendor" TEXT,
  "Material" TEXT,
  "Cavity" TEXT,
  "Location" TEXT,
  "PurchaseDate" TEXT,
  "Notes" TEXT,
  "Status" TEXT DEFAULT 'Active',
  "ImageIds" TEXT DEFAULT '[]',
  "CreatedAt" TIMESTAMPTZ DEFAULT NOW()
);

-- 2. MACHINES (ตารางเครื่องจักร)
CREATE TABLE IF NOT EXISTS machines (
  "ID" TEXT PRIMARY KEY,
  "Name" TEXT NOT NULL,
  "AssetNo" TEXT,
  "Vendor" TEXT,
  "Model" TEXT,
  "Location" TEXT,
  "PurchaseDate" TEXT,
  "Notes" TEXT,
  "Status" TEXT DEFAULT 'Active',
  "ImageIds" TEXT DEFAULT '[]',
  "CreatedAt" TIMESTAMPTZ DEFAULT NOW()
);

-- 3. STOCK_PARTS (ตารางอะไหล่)
CREATE TABLE IF NOT EXISTS stock_parts (
  "ID" TEXT PRIMARY KEY,
  "PartName" TEXT NOT NULL,
  "PartNo" TEXT,
  "Category" TEXT,
  "Qty" NUMERIC DEFAULT 0,
  "MinQty" NUMERIC DEFAULT 0,
  "Unit" TEXT,
  "Location" TEXT,
  "LinkedType" TEXT,
  "LinkedID" TEXT,
  "ImageIds" TEXT DEFAULT '[]',
  "CreatedAt" TIMESTAMPTZ DEFAULT NOW()
);

-- 4. ISSUES (ตารางแจ้งปัญหา/แจ้งซ่อม)
CREATE TABLE IF NOT EXISTS issues (
  "ID" TEXT PRIMARY KEY,
  "TargetType" TEXT,
  "TargetID" TEXT,
  "TargetName" TEXT,
  "IssueType" TEXT,
  "Description" TEXT,
  "OccurredAt" TEXT,
  "ReportedBy" TEXT,
  "Severity" TEXT,
  "Status" TEXT DEFAULT 'Open',
  "BeforeImageIds" TEXT DEFAULT '[]',
  "ClosedAt" TEXT,
  "ClosedBy" TEXT,
  "RootCause" TEXT,
  "CorrectiveAction" TEXT,
  "PartsUsed" TEXT,
  "AfterImageIds" TEXT DEFAULT '[]',
  "CreatedAt" TIMESTAMPTZ DEFAULT NOW()
);

-- 5. TPM_PLANS (ตารางแผนงานและบันทึกผล TPM)
CREATE TABLE IF NOT EXISTS tpm_plans (
  "ID" TEXT PRIMARY KEY,
  "TargetType" TEXT,
  "TargetID" TEXT,
  "TargetName" TEXT,
  "Year" NUMERIC,
  "PlannedDate" TEXT,
  "AssignedTo" TEXT,
  "ChecklistTemplate" TEXT,
  "Status" TEXT DEFAULT 'Planned',
  "ActualDate" TEXT,
  "ActualBy" TEXT,
  "ChecklistResult" TEXT DEFAULT '{}',
  "Notes" TEXT,
  "AfterImageIds" TEXT DEFAULT '[]',
  "CreatedAt" TIMESTAMPTZ DEFAULT NOW()
);

-- ปิดการใช้งาน RLS เพื่อเปิดสิทธิ์การอ่าน-เขียนผ่าน Anon API Key
ALTER TABLE molds DISABLE ROW LEVEL SECURITY;
ALTER TABLE machines DISABLE ROW LEVEL SECURITY;
ALTER TABLE stock_parts DISABLE ROW LEVEL SECURITY;
ALTER TABLE issues DISABLE ROW LEVEL SECURITY;
ALTER TABLE tpm_plans DISABLE ROW LEVEL SECURITY;
