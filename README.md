# 🛒 Online Retail Sales Database Project

## 📌 Objective
The goal of this project is to design and implement a **normalized SQL schema** for an e-commerce platform that manages customers, products, orders, payments, and generates sales reports.

---

## 🛠️ Tools & Technologies
- **Database**: MySQL / PostgreSQL  
- **Diagram Tool**: dbdiagram.io  
- **Language**: SQL  

---

## 📂 Project Structure
- `schema.sql` → Database schema (DDL scripts: CREATE TABLEs with constraints)  
- `sample_data.sql` → Sample data insertion (INSERT statements)  
- `queries.sql` → SQL queries for reports (JOINs, aggregations)  
- `views.sql` → SalesReport view definition  
- `README.md` → Project documentation  

---

## 📊 ER Diagram
The database schema is represented using an ER diagram created in **dbdiagram.io**.  

![ER Diagram](link-to-your-diagram-screenshot.png)

---

## 📑 Database Schema (3NF)
### Entities:
1. **Customers** – Stores customer information  
2. **Products** – Stores product catalog  
3. **Orders** – Stores customer orders  
4. **Order_Items** – Stores items in each order  
5. **Payments** – Stores payment details  

All tables are normalized up to **3NF**.  

---

## 🗄️ SQL Schema (DDL)
Example:
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT
);
