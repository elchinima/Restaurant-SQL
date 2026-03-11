# 🍽️ Restoraunt Database

Bu layihə **SQL Server (MSSQL)** istifadə edilərək yaradılmış sadə restoran məlumat bazasıdır.  
Database restoranın **masalarını**, **yeməklərini** və **sifarişlərini** idarə etmək üçün hazırlanmışdır.

---

## 📦 Database Strukturu

Database 3 əsas cədvəldən ibarətdir:

### 🪑 Tables
Restorandakı masaların məlumatlarını saxlayır.

| Column | Description |
|------|------|
| TableId | Masanın unikal ID-si |
| Number | Masanın nömrəsi |

---

### 🍔 Meals
Restorandakı yeməkləri və onların qiymətlərini saxlayır.

| Column | Description |
|------|------|
| MealId | Yeməyin unikal ID-si |
| Name | Yeməyin adı |
| Price | Yeməyin qiyməti |

---

### 🧾 Orders
Masalara verilmiş sifarişləri saxlayır.

| Column | Description |
|------|------|
| OrderId | Sifariş ID |
| MealId | Sifariş olunan yemək |
| TableId | Sifariş verən masa |
| OrderDate | Sifarişin tarix və saatı |

---

## 🔗 Cədvəllər Arası Əlaqə

Database-də **Foreign Key** əlaqələri istifadə olunur:

- `Orders.MealId → Meals.MealId`
- `Orders.TableId → Tables.TableId`

Bu əlaqələr sayəsində hər sifariş konkret **masa və yeməyə bağlanır**.

---

## ⚙️ İstifadə olunan SQL əmrləri

Layihədə aşağıdakı SQL əmrlərindən istifadə edilmişdir:

- `CREATE DATABASE`
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `JOIN`
- `GROUP BY`
- `COUNT`
- `SUM`
- `DATEDIFF`
- `DATEADD`

---

## 🔍 Yazılmış Sorğular (Queries)

Bu layihədə aşağıdakı sorğular hazırlanmışdır:

- Bütün masaları onların **sifariş sayı ilə birlikdə göstərmək**
- Bütün yeməkləri onların **sifariş sayı ilə göstərmək**
- Bütün sifarişləri **yeməyin adı ilə göstərmək**
- Bütün sifarişləri **yeməyin adı və masa nömrəsi ilə göstərmək**
- Hər masanın **ümumi sifariş məbləğini göstərmək**
- **1-ci masanın ilk və son sifarişi arasındakı saat fərqini tapmaq**
- **Son 30 dəqiqədən əvvəl verilmiş sifarişləri tapmaq**
- **Heç sifariş verməmiş masaları tapmaq**
- **Son 60 dəqiqədə sifariş verməmiş masaları tapmaq**