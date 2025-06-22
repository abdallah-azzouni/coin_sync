# 💰 CoinSync

> A cross-platform personal finance tracker built with Flutter and Supabase.  
> Designed for multi-device usage, offline edits, and real-time sync.

---

## 📸 Screenshots

| Main Dashboard | Add Transaction | Account Progress |
|----------------|------------------|------------------|
| <img src="docs/images/dashboard.png" width="200"> | *photo2* | *photo3* |

---

## 🛠 Tech Stack

| Layer         | Stack Used                    |
|--------------|-------------------------------|
| Frontend     | Flutter                        |
| Backend      | Supabase (PostgreSQL + Auth)   |
| Design       | Figma            |

---

## 📆 Project Timeline

### ⛏️ Planning & Design

- [x] **1. ERD Design**
  - Design core database structure and relationships
  - Tool: supabase
  - Output: `docs/database/images/supabase-schema.png`

- [ ] **2. Figma UI Design**
  - Create UI mockups for core screens (dashboard, add/edit transaction, sync)
  - Tool: Figma
  - Output: `docs/ui/figma-screens.fig` or `.png`

---

### 🛠️ Development

- [ ] **3. Flutter App Structure**
  - Set up main routes and screen navigation
  - Build reusable widgets based on Figma

- [ ] **4. Finalize Database in Supabase**
  - Translate ERD into actual Supabase tables
  - Use Supabase Table Editor / SQL Editor

- [ ] **5. Connect Flutter ↔ Supabase**
  - Integrate Supabase Auth and Database SDK
  - Set up real-time sync and offline handling logic

---

### 🧪 Finalization

- [ ] **6. Testing & Sync Logic**
  - Test across devices (offline edits, conflict resolution)
  - Improve performance and edge cases

- [ ] **7. Documentation & Polish**
  - Include architecture, ERD, and Figma files
  - Add setup guide and usage instructions in `README.md`

---

