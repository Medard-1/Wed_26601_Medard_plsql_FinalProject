# 📦 PROJECT TITLE: E-Commerce Logistics Optimization : Smart Inventory & Delivery System

## NAME: MEDARD MUSINGUZI
## ID: 26601 

## Phase 1 📊  
 

## 🎯 Phase Overview:

## System Foundations 

This phase establishes the core framework for our PL/SQL-powered logistics solution, covering:  

### 🔍 **Problem Definition**  

🚨 *Current Challenges:*  
- 📉 Inefficient inventory management  
- 🚚 Delivery tracking blindspots  
- 😠 Customer dissatisfaction due to delays  
- 📊 Lack of real-time operational visibility  

### 🌐 **System Context**  

🏢 Designed for medium-large e-commerce retailers  
👥 Key Users:  
- 🏭 Warehouse Staff  
- 🚛 Delivery Drivers  
- 📞 Customer Service  
- 👔 Management  

### 🏗️ **Core Entities**

```sql
PRODUCTS (📦 ProductID, Name, StockQty, Price)  
ORDERS (📋 OrderID, CustomerID, Status, ShippingAddr)  
CUSTOMERS (👤 CustomerID, Name, Contact)  
INVENTORY (🏷️ InventoryID, Location, StockLevel)  
DELIVERIES (🚚 DeliveryID, DriverID, Route, Status)  
DRIVERS (🧑✈️ DriverID, Name, Contact)
```
## 🎯 Project Goals

- Automate inventory management and order processing.
- Optimize delivery routes and reduce delivery times.
- Provide real-time order tracking and delivery status updates.
- Improve customer satisfaction through efficient and reliable delivery.
- Generate detailed reports for inventory and delivery analysis.



## 🌟 Anticipated Benefits

- 📉 30% reduction in stockouts

- ⏱️ 25% faster deliveries

- 💰 15% lower inventory costs

- 📱 Real-time customer notifications

---


# 📘 Phase II: Business Process Modeling (MIS)

This project models how orders are processed and delivered in a smart e-commerce system using MIS (Management Information System).

---

## 🎯 Objective
To make order processing and delivery faster and smarter using technology (MIS).

---

## 🔍 What Is Happening Here?

When a customer places an order:
1. ✅ MIS checks if the item is in stock.
2. 📦 Warehouse staff packs the item.
3. 🚚 Delivery driver gets the best route.
4. 🧾 Customer service can see all updates.
5. 📈 Managers get reports to improve service.

---

## 🧠 Who Does What?

- 👨‍🏭 **Warehouse Staff**: Picks and packs items.
- 🖥️ **MIS (Inventory System)**: Checks stock and sends alerts.
- 🚛 **Delivery Driver**: Delivers packages and updates status.
- ☎️ **Customer Service**: Answers customer questions.

---

## 🔄 The Flow

1. 🟢 Start: Customer places an order.
2. 🧮 MIS checks stock.
3. ❓ If stock is available:
   - 🏷️ Item reserved and packed.
   - 🚗 Route optimized for driver.
4. 🗣️ Driver gets delivery job.
5. ✅ Driver delivers the item.
6. 📲 Status is updated in the system.
7. 📞 Customer service gets updates.
8. 🔴 End: Order is delivered.

---
## 📸 Screenshot of BPMN Diagram

![image](https://github.com/user-attachments/assets/d6f92927-38d7-428e-9ac7-4b3311425c45)


## 📦 Tools Used

- 🛠️ draw.io for diagrams
- 📜 PL/SQL for automation and smart routing
- 🧭 Oracle Spatial for map optimization

---

## 💡 Benefits

- 🚀 Faster deliveries
- 👁️ Real-time updates
- 🤝 Happy customers
- 💰 Save money on stock
- 📊 Smart reports for better decisions

---


# 🧠 Phase III: Logical Model Design – E-Commerce Logistics Optimization

## Phase III project: **"E-Commerce Logistics Optimization: A Smart Inventory & Delivery System"**! 🎯

In this phase, I'll build a **logical data model** to support efficient operations.

---

## 🧱 1. Entity-Relationship (ER) Model

Here are the core entities in my system, with attributes and relationships:

### 👤 Customers
- `CustomerID` (PK)
- `CustomerName`
- `ContactInfo`
- `Address`

### 📦 Products
- `ProductID` (PK)
- `ProductName`
- `Description`
- `StockQuantity`
- `Price`

### 🗃️ Inventory
- `InventoryID` (PK)
- `ProductID` (FK → Products)
- `WarehouseLocation`
- `StockLevel`

### 🧾 Orders
- `OrderID` (PK)
- `CustomerID` (FK → Customers)
- `OrderDate`
- `OrderStatus`
- `ShippingAddress`

### 🧮 OrderDetails
- `OrderDetailID` (PK)
- `OrderID` (FK → Orders)
- `ProductID` (FK → Products)
- `Quantity`
- `PriceAtOrderTime`

### 🚚 Deliveries
- `DeliveryID` (PK)
- `OrderID` (FK → Orders)
- `DriverID` (FK → Drivers)
- `DeliveryDate`
- `DeliveryStatus`
- `Route`

### 👷 Drivers
- `DriverID` (PK)
- `DriverName`
- `ContactInfo`

---

## 🔗 2. Relationships & Constraints

| Relationship              | Type  | Description                                 |
|---------------------------|-------|---------------------------------------------|
| Customers → Orders        | 1:M   | One customer places many orders             |
| Products → Inventory      | 1:M   | One product in multiple warehouse locations |
| Orders → OrderDetails     | 1:M   | One order can include many products         |
| Products → OrderDetails   | 1:M   | A product can appear in multiple orders     |
| Orders → Deliveries       | 1:1   | Each order has one delivery assigned        |
| Drivers → Deliveries      | 1:M   | A driver can make many deliveries           |

🔐 **Constraints**:
- `NOT NULL` on required fields
- `UNIQUE` on primary identifiers
- `CHECK`: `StockLevel ≥ 0`, `Quantity ≥ 1`
- `DEFAULT`: `OrderStatus = 'Pending'`, `DeliveryStatus = 'Scheduled'`

---

## 🔄 3. Normalization (3NF)

✅ All tables meet **Third Normal Form (3NF)**:
- Atomic attributes
- Functional dependencies are on PKs
- No transitive dependencies

---

## 🌍 4. Real-World Data Scenarios

The model supports:
- Tracking multiple products per order 🧾
- Warehouse-based stock availability 🏢
- Assigning and tracking deliveries per driver 🛻
- Generating performance reports 📊
- Handling updates and queries from all departments 💼

---

## 🖼️ Screenshot of ERD Diagram

![image](https://github.com/user-attachments/assets/55aecb7a-d8c5-4478-9540-ccf7eb1b48da)


---

# 🗃 Phase IV: Database Creation and Naming (Pluggable Database Implementation)

## 🔖 Covers: Physical DB creation, user access, naming conventions, Oracle OEM setup.

### 🎯 Objective

This phase focuses on building the physical environment for the system designed in Phases I–III. Using Oracle PL/SQL, we establish a named pluggable database, manage user roles, and prepare for monitoring and reporting via Oracle Enterprise Manager (OEM). This foundation allows the logical model to be executed in a real database environment.

### 🔨Database Creation

The Pluggable Database (PDB) was created using the following naming format:

Database Name: 🗃 Phase IV: Database Creation and Naming (Pluggable Database Implementation)
🔖 Covers: Physical DB creation, user access, naming conventions, Oracle OEM setup, GitHub documentation

🎯 Objective
This phase focuses on building the physical environment for the system designed in Phases I–III. Using Oracle PL/SQL, we establish a named pluggable database, manage user roles, and prepare for monitoring and reporting via Oracle Enterprise Manager (OEM). This foundation allows the logical model to be executed in a real database environment.

## 🔨Database Creation

The Pluggable Database (PDB) was created using the following naming format:

```sql
Database Name: wed_26601_medard_optimization_db
Username: medard
Password: medard
```
## 1.Create a pluggable database:

```sql
SQL> CREATE PLUGGABLE DATABASE wed_26601_medard_logistics_optimization_db
  2  ADMIN USER medard IDENTIFIED BY medard
  3    FILE_NAME_CONVERT = (
  4      'C:\ORACLE21C\ORADATA\ORCL\PDBSEED\',
  5      'C:\ORACLE21C\ORADATA\ORCL\WED_26601_MEDARD_LOGISTICS_OPTIMIZATION_DB\'
  6    );

Pluggable database created.
```
## 2.Open the newly created PDB:
```sql
SQL> ALTER PLUGGABLE DATABASE wed_26601_medard_logistics_optimization_db OPEN;

Pluggable database altered.
```
Use Makes the PDB ready for operations.
## 3.save the newly created PDB.
```sql
SQL> ALTER PLUGGABLE DATABASE wed_26601_medard_logistics_optimization_db SAVE STATE;

Pluggable database altered.
```

- Use It makes sure that the PDB remains open after the database restarts.

## 4. Set the Session Container
```sql
SQL> ALTER SESSION SET CONTAINER = wed_26687_gloria_online_retail_db;

Session altered.
```
- Use: It changes the session to the newly created PDB for subsequent operations.

## 5.User Creation and Privilege Assignment
## Create a Database User
```sql
SQL> create user gloria identified by gloria;

User created.
```
- Use: It creates a new user, medard, with the password medard.

## Grant Basic Privileges

```sql
SQL> GRANT CONNECT, RESOURCE, DBA, SYSDBA TO gloria;

Grant succeeded.
```
- Use: To assigns full privileges for database operations.

- Use: To assigns full privileges for database operations.

### 📸 Screenshot of PDB Creation
 
![pdb_creation](https://github.com/user-attachments/assets/0312f6d8-4a6a-4b4c-b54c-ea07a2c0e8ba)

## ⚖ Oracle Enterprise Manager (OEM)
## The OEM interface confirmed:

- Successful creation of the database.
- Proper implementation of relationships between tables.

## 📸 OEM confirm successful database creation and table relationships.

![OEM](https://github.com/user-attachments/assets/2a6b9eb3-f4d9-40d2-80ad-ca211545bd80)

---








