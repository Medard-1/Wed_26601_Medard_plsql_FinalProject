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


# 🧠 Phase III: Logical Model Design – E-Commerce Logistics Optimization🎯

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


# 📦 Phase V: Table Implementation & Data Insertion

Welcome to **Phase 5** of the E-Commerce Logistics Optimization System project! 🎯 This phase is alll about transforming our logical model into a real, functional Oracle database structure 💾 — with fully defined tables and sample data to simulate real-world use. 🚚📊

---

## 🧱 1. Table Creation

We have created the following tables to support the system's operations:

- 👤 `Customers` – Stores buyer details like name, contact info, and address.
- 📦 `Products` – Stores product listings, availability, and pricing.
- 🏪 `Inventory` – Tracks stock levels at various warehouse locations.
- 📑 `Orders` – Captures customer orders with their status and shipping address.
- 🧍‍♂️ `Drivers` – Information about delivery drivers.
- 🚚 `Deliveries` – Tracks the delivery status, route, and assigned driver for each order.

✅ All tables are built with:
- **Primary Keys (PK)** for unique identification 🔑
- **Foreign Keys (FK)** for relationships 🔗
- Constraints like `NOT NULL`, `UNIQUE`, `CHECK`, and `DEFAULT` for data validity ✔️

### 🔧 SQL Table Creation Queries:

```sql
CREATE TABLE Customers (
    CustomerID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FirstName       VARCHAR2(50) NOT NULL,
    LastName        VARCHAR2(50) NOT NULL,
    ContactInfo     VARCHAR2(100),
    Address         VARCHAR2(255) NOT NULL
);

CREATE TABLE Products (
    ProductID       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductName     VARCHAR2(100) NOT NULL UNIQUE,
    Description     VARCHAR2(255),
    StockQuantity   NUMBER DEFAULT 0 CHECK (StockQuantity >= 0),
    Price           NUMBER(10,2) NOT NULL CHECK (Price >= 0)
);

CREATE TABLE Inventory (
    InventoryID         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductID           NUMBER NOT NULL,
    WarehouseLocation   VARCHAR2(100) NOT NULL,
    StockLevel          NUMBER DEFAULT 0 CHECK (StockLevel >= 0),
    CONSTRAINT fk_inventory_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Orders (
    OrderID         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CustomerID      NUMBER NOT NULL,
    OrderDate       DATE DEFAULT SYSDATE,
    OrderStatus     VARCHAR2(50) CHECK (OrderStatus IN ('Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled')),
    ShippingAddress VARCHAR2(255) NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Drivers (
    DriverID        NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FirstName       VARCHAR2(50) NOT NULL,
    LastName        VARCHAR2(50) NOT NULL,
    ContactInfo     VARCHAR2(100)
);

CREATE TABLE Deliveries (
    DeliveryID      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderID         NUMBER NOT NULL,
    DriverID        NUMBER NOT NULL,
    DeliveryDate    DATE,
    DeliveryStatus  VARCHAR2(50) CHECK (DeliveryStatus IN ('Assigned', 'In Transit', 'Delivered', 'Failed')),
    Route           VARCHAR2(255),
    CONSTRAINT fk_deliveries_order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_deliveries_driver FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);
```

---

## 📝 2. Data Insertion

Realistic data has been added to simulate real-world scenarios:

- 👥 10 diverse customers from various Rwandan cities.
- 🛒 10 essential products like milk, sugar, rice, and bread.
- 🏢 Inventory across different warehouses (e.g., Kigali, Gisenyi, Butare).
- 🧾 10 sample orders with varying statuses.
- 🧑‍✈️ 10 drivers with unique contact information.
- 📦 10 deliveries with assigned routes and delivery status updates.

### 🗃️ SQL Data Insertion Queries:

```sql
-- Insert Customers
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Jean', 'Uwimana', '+250788123456', 'KN 45 St, Kigali');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Marie', 'Mukamana', '+250788234567', 'KG 12 Ave, Gisenyi');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Pierre', 'Niyonsenga', '+250788345678', 'KK 78 Rd, Kigali');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Claudine', 'Uwase', '+250788456789', 'KG 56 St, Butare');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Emmanuel', 'Habimana', '+250788567890', 'KN 23 Ave, Kigali');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Josiane', 'Iradukunda', '+250788678901', 'KG 34 Rd, Gitarama');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Theophile', 'Nkundimana', '+250788789012', 'KN 67 St, Kigali');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Ange', 'Mutesi', '+250788890123', 'KG 89 Ave, Kibuye');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Eric', 'Rutaganda', '+250788901234', 'KN 12 Rd, Kigali');
INSERT INTO Customers (FirstName, LastName, ContactInfo, Address) VALUES 
('Valentine', 'Nyirahabimana', '+250788012345', 'KG 45 St, Ruhengeri');
```
-- Insert Products
```sql
INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Milk 1L', 'Fresh cow milk 1 liter', 100, 1200);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Sugar 1kg', 'Premium white sugar', 200, 1500);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Rice 5kg', 'Long grain rice', 150, 7500);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Cooking Oil 1L', 'Vegetable cooking oil', 80, 2500);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Beans 1kg', 'Red kidney beans', 120, 1800);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Maize Flour 2kg', 'Fine maize flour', 90, 1600);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Tea Leaves 250g', 'Rwandan black tea', 60, 1200);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Bread Loaf', 'Fresh white bread', 70, 800);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Eggs (Tray)', '30 eggs tray', 50, 3500);
    INSERT INTO Products (ProductName, Description, StockQuantity, Price) VALUES 
    ('Mineral Water 1L', 'Bottled drinking water', 200, 600);
```
-- Insert Inventory
```sql
INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (1, 'Gisenyi Warehouse', 50);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (2, 'Butare Warehouse', 75);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (3, 'Kigali Main Warehouse', 100);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (4, 'Ruhengeri Warehouse', 40);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (5, 'Kigali Main Warehouse', 60);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (6, 'Gitarama Warehouse', 45);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (7, 'Kigali Main Warehouse', 30);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (8, 'Kibuye Warehouse', 35);
    INSERT INTO Inventory (ProductID, WarehouseLocation, StockLevel) VALUES 
    (9, 'Kigali Main Warehouse', 25);
```

-- Insert Drivers
```sql
INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Samuel', 'Niyomugabo', '+250788112233');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('David', 'Hakizimana', '+250788223344');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Patrick', 'Mugisha', '+250788334455');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Alex', 'Nsengimana', '+250788445566');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Paul', 'Rwigema', '+250788556677');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Jean', 'Twahirwa', '+250788667788');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Eric', 'Mugabo', '+250788778899');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Emmanuel', 'Rutayisire', '+250788889900');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Joseph', 'Nkusi', '+250788990011');
    INSERT INTO Drivers (FirstName, LastName, ContactInfo) VALUES 
    ('Peter', 'Rukundo', '+250788001122');

```

-- Insert Orders
```sql
  INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (1, TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Delivered', 'KN 45 St, Kigali');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (2, TO_DATE('2023-05-02', 'YYYY-MM-DD'), 'Processing', 'KG 12 Ave, Gisenyi');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (3, TO_DATE('2023-05-03', 'YYYY-MM-DD'), 'Shipped', 'KK 78 Rd, Kigali');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (4, TO_DATE('2023-05-04', 'YYYY-MM-DD'), 'Pending', 'KG 56 St, Butare');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (5, TO_DATE('2023-05-05', 'YYYY-MM-DD'), 'Delivered', 'KN 23 Ave, Kigali');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (6, TO_DATE('2023-05-06', 'YYYY-MM-DD'), 'Processing', 'KG 34 Rd, Gitarama');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (7, TO_DATE('2023-05-07', 'YYYY-MM-DD'), 'Shipped', 'KN 67 St, Kigali');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (8, TO_DATE('2023-05-08', 'YYYY-MM-DD'), 'Pending', 'KG 89 Ave, Kibuye');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (9, TO_DATE('2023-05-09', 'YYYY-MM-DD'), 'Delivered', 'KN 12 Rd, Kigali');
INSERT INTO Orders (CustomerID, OrderDate, OrderStatus, ShippingAddress) VALUES (10, TO_DATE('2023-05-10', 'YYYY-MM-DD'), 'Processing', 'KG 45 St, Ruhengeri');

```

-- Insert Deliveries
```sql
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (1, 1, TO_DATE('2023-05-03', 'YYYY-MM-DD'), 'Delivered', 'Route 1 - Kigali Main Warehouse to KN 45 St, Kigali');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (2, 2, NULL, 'Assigned', 'Route 2 - Gisenyi Warehouse to KG 12 Ave, Gisenyi');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (3, 3, NULL, 'In Transit', 'Route 3 - Kigali Main Warehouse to KK 78 Rd, Kigali');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (4, 4, NULL, 'Assigned', 'Route 4 - Butare Warehouse to KG 56 St, Butare');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (5, 5, TO_DATE('2023-05-07', 'YYYY-MM-DD'), 'Delivered', 'Route 5 - Kigali Main Warehouse to KN 23 Ave, Kigali');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (6, 6, NULL, 'Assigned', 'Route 6 - Gitarama Warehouse to KG 34 Rd, Gitarama');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (7, 7, NULL, 'In Transit', 'Route 7 - Kigali Main Warehouse to KN 67 St, Kigali');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (8, 8, NULL, 'Assigned', 'Route 8 - Kibuye Warehouse to KG 89 Ave, Kibuye');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (9, 9, TO_DATE('2023-05-11', 'YYYY-MM-DD'), 'Delivered', 'Route 9 - Kigali Main Warehouse to KN 12 Rd, Kigali');
INSERT INTO Deliveries (OrderID, DriverID, DeliveryDate, DeliveryStatus, Route) VALUES (10, 10, NULL, 'Assigned', 'Route 10 - Ruhengeri Warehouse to KG 45 St, Ruhengeri');


```

---

## 🔐 3. Data Integrity

Data was inserted with **careful validation** to ensure:

- Referential integrity via foreign key constraints.
- Logical correctness (e.g., non-negative stock quantities, valid delivery statuses).
- Compliance with the defined schema and constraints.

This setup ensures accurate, consistent, and valid data across the system! 🎯

---

## 🏗️ 4. Physical Database Structure

The logical model has been converted into an efficient physical structure using Oracle SQL syntax:

- 📌 Auto-incrementing `IDENTITY` columns for IDs.
- 🧩 Defined relationships across `CustomerID`, `ProductID`, `OrderID`, `DriverID`.
- ⛓ Constraints to enforce data rules:
  - ✅ `NOT NULL` – Required values
  - 🚫 `CHECK` – Valid ranges/status
  - 🔒 `UNIQUE` – No duplicates for key fields

---

## 📥 How to Use

To implement this phase in Oracle:

1. Run the insert data properly.
2. Use Oracle SQL Developer to execute the script.

---


# 📦 Phase VI: Database Interaction and Transactions

This phase focuses on database interaction 🗃️, ensuring that operations such as fetching data, performing transformations, and handling errors are done effectively. It also promotes modular programming by using procedures, functions, and packages 📚 to organize and manage database operations efficiently.

---

## ✅ Tasks and Deliverables

### 1. Database Operations 🔄

Perform DML (Data Manipulation Language) and DDL (Data Definition Language) operations to interact with the database.

- **DML Operations** (Insert, Update, Delete)
```sql
-- Add a new column to track order priority
ALTER TABLE Orders ADD Priority VARCHAR2(10) CHECK (Priority IN ('Low', 'Medium', 'High'));

-- Update orders with priority levels
UPDATE Orders SET Priority = 
  CASE 
    WHEN OrderID BETWEEN 1 AND 3 THEN 'High'
    WHEN OrderID BETWEEN 4 AND 7 THEN 'Medium'
    ELSE 'Low'
  END;

-- Delete test orders
DELETE FROM Orders WHERE OrderStatus = 'Test';
```

- **DDL Operations** (Create, Alter, Drop) are demonstrated by the ALTER command above.

---

### 2. Simple Problem Statement 📈

We analyze customer purchasing patterns using window functions. This helps us understand customer value and rank them accordingly.

```sql
SELECT 
  c.CustomerID,
  c.FirstName || ' ' || c.LastName AS CustomerName,
  o.OrderID,
  o.OrderDate,
  COUNT(o.OrderID) OVER (PARTITION BY c.CustomerID) AS TotalOrders,
  SUM(p.Price * od.Quantity) OVER (PARTITION BY c.CustomerID) AS TotalSpent,
  RANK() OVER (ORDER BY SUM(p.Price * od.Quantity) OVER (PARTITION BY c.CustomerID) DESC) AS CustomerRank
FROM 
  Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate;
```

---

### 3. Parameterized Procedures with Cursors 🔍

Fetch values from the database using a procedure and cursors for better control over data.

```sql
CREATE OR REPLACE PROCEDURE GetCustomerOrders(p_CustomerID IN Customers.CustomerID%TYPE) AS
  CURSOR order_cursor IS
    SELECT o.OrderID, o.OrderDate, o.OrderStatus, COUNT(d.DeliveryID) AS DeliveryCount
    FROM Orders o
    LEFT JOIN Deliveries d ON o.OrderID = d.OrderID
    WHERE o.CustomerID = p_CustomerID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatus;
  v_order_rec order_cursor%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Orders for Customer ID: ' || p_CustomerID);
  OPEN order_cursor;
  LOOP
    FETCH order_cursor INTO v_order_rec;
    EXIT WHEN order_cursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_rec.OrderID);
    DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_order_rec.OrderDate, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Status: ' || v_order_rec.OrderStatus);
    DBMS_OUTPUT.PUT_LINE('Delivery Attempts: ' || v_order_rec.DeliveryCount);
  END LOOP;
  CLOSE order_cursor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No orders found for this customer.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
```

---

### 4. Function to Calculate Delivery Fee 🚚

```sql
CREATE OR REPLACE FUNCTION CalculateDeliveryFee(p_DistanceKM IN NUMBER, p_OrderValue IN NUMBER) RETURN NUMBER IS
  v_BaseFee NUMBER := 1500;
  v_DistanceFee NUMBER;
  v_TotalFee NUMBER;
BEGIN
  IF p_DistanceKM <= 5 THEN
    v_DistanceFee := 0;
  ELSE
    v_DistanceFee := (p_DistanceKM - 5) * 500;
  END IF;

  IF p_OrderValue > 50000 THEN
    v_TotalFee := 0;
  ELSE
    v_TotalFee := v_BaseFee + v_DistanceFee;
  END IF;

  RETURN v_TotalFee;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END;
```

---

### 5. Package Implementation 📦

Encapsulating procedures and functions for modular use.

```sql
CREATE OR REPLACE PACKAGE OrderManagement AS
  PROCEDURE PlaceNewOrder(p_CustomerID IN Orders.CustomerID%TYPE, p_ShippingAddress IN Orders.ShippingAddress%TYPE, p_Priority IN Orders.Priority%TYPE DEFAULT 'Medium');
  FUNCTION CheckProductStock(p_ProductID IN Products.ProductID%TYPE, p_Quantity IN NUMBER) RETURN BOOLEAN;
  PROCEDURE UpdateOrderStatus(p_OrderID IN Orders.OrderID%TYPE, p_NewStatus IN Orders.OrderStatus%TYPE);
END;
```

```sql
CREATE OR REPLACE PACKAGE BODY OrderManagement AS
  PROCEDURE PlaceNewOrder(...) IS BEGIN ... END;
  FUNCTION CheckProductStock(...) RETURN BOOLEAN IS BEGIN ... END;
  PROCEDURE UpdateOrderStatus(...) IS BEGIN ... END;
END;
```

---

### 6. Exception Handling 🛡️

Handling edge cases and unexpected errors.

```sql
CREATE OR REPLACE PROCEDURE ProcessDelivery(p_DeliveryID IN Deliveries.DeliveryID%TYPE, p_NewStatus IN Deliveries.DeliveryStatus%TYPE) AS
  ...
BEGIN
  ...
EXCEPTION
  WHEN v_InvalidTransition THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Invalid status transition.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
```

---

## 🧪 Testing Plan

1. **Test Window Functions** for ranking and totals.
2. **Procedure Tests**: Fetch customer orders using valid and invalid inputs.
3. **Function Tests**: Check delivery fee calculations with various scenarios.
4. **Package Tests**: Validate order placement and stock management.
5. **Exception Handling Tests**: Trigger error scenarios to ensure robustness.

---

# 📘 Advanced Database Programming & Auditing – Phase VII

In this phase, we enhance our e-commerce database system by implementing **advanced PL/SQL programming** and **auditing mechanisms**. These features ensure business logic enforcement, security, and user accountability 🚀.

---

## 📌 Problem Statement

Our e-commerce platform requires strict control over **order processing times** and **compliance logging** for security purposes:

* ❌ Block modifications to orders on **weekdays (Monday–Friday)**.
* 🗓️ Prevent order manipulations during **official public holidays**.
* 🕵️ Track all sensitive database operations for **auditing and accountability**.

We use:

* **Triggers** for restriction enforcement.
* **Packages** for reusable auditing utilities.
* **Audit tables** to record access attempts and actions.

---

## 🗓️ 1. Holiday Reference Table

```sql
CREATE TABLE PublicHolidays (
    HolidayID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    HolidayName VARCHAR2(100) NOT NULL,
    HolidayDate DATE NOT NULL,
    Description VARCHAR2(255),
    UNIQUE (HolidayDate)
);

-- Insert public holidays for the upcoming month (Rwanda example)
INSERT INTO PublicHolidays (HolidayName, HolidayDate, Description) VALUES 
('Liberation Day', TO_DATE('04-JUL-2025', 'DD-MON-YYYY'), 'Celebration of the end of the 1994 genocide');

INSERT INTO PublicHolidays (HolidayName, HolidayDate, Description) VALUES 
('Assumption Day', TO_DATE('15-AUG-2025', 'DD-MON-YYYY'), 'Feast of the Assumption of Mary');

INSERT INTO PublicHolidays (HolidayName, HolidayDate, Description) VALUES 
('Heroes Day', TO_DATE('01-FEB-2025', 'DD-MON-YYYY'), 'Day honoring national heroes');
```

---

## 📝 2. Audit Logging Table

```sql
CREATE TABLE OrderAuditLog (
    AuditID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    UserID VARCHAR2(100) NOT NULL,
    ActionDate TIMESTAMP DEFAULT SYSTIMESTAMP NOT NULL,
    TableName VARCHAR2(50) NOT NULL,
    ActionType VARCHAR2(10) NOT NULL, -- INSERT, UPDATE, DELETE
    RecordID NUMBER NOT NULL,
    OldValue CLOB,
    NewValue CLOB,
    Status VARCHAR2(20) NOT NULL, -- SUCCESS, FAILED, RESTRICTED
    Comments VARCHAR2(255)
);
```

---

## 🔄 3. Compound Trigger: `OrderProcessingRestrictions`

```sql
CREATE OR REPLACE TRIGGER OrderProcessingRestrictions
FOR INSERT OR UPDATE OR DELETE ON Orders
COMPOUND TRIGGER
    v_is_weekday BOOLEAN := FALSE;
    v_is_holiday BOOLEAN := FALSE;
    v_restriction_message VARCHAR2(255);
    v_action VARCHAR2(10);
    v_user VARCHAR2(100);

    BEFORE STATEMENT IS
    BEGIN
        IF TO_NUMBER(TO_CHAR(SYSDATE, 'D')) BETWEEN 2 AND 6 THEN
            v_is_weekday := TRUE;
        END IF;

        BEGIN
            SELECT 1 INTO v_is_holiday
            FROM PublicHolidays
            WHERE HolidayDate = TRUNC(SYSDATE)
            AND ROWNUM = 1;
            v_is_holiday := TRUE;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_is_holiday := FALSE;
        END;

        IF INSERTING THEN v_action := 'INSERT';
        ELSIF UPDATING THEN v_action := 'UPDATE';
        ELSIF DELETING THEN v_action := 'DELETE';
        END IF;

        v_user := USER;
    END BEFORE STATEMENT;

    BEFORE EACH ROW IS
    BEGIN
        IF v_is_weekday OR v_is_holiday THEN
            IF v_is_weekday THEN
                v_restriction_message := 'Order modifications not allowed on weekdays (Monday-Friday)';
            ELSE
                v_restriction_message := 'Order modifications not allowed on public holidays';
            END IF;

            INSERT INTO OrderAuditLog (
                UserID, TableName, ActionType, 
                RecordID, Status, Comments
            ) VALUES (
                v_user, 'ORDERS', v_action,
                :NEW.OrderID, 'RESTRICTED', v_restriction_message
            );

            RAISE_APPLICATION_ERROR(-20001, v_restriction_message);
        END IF;
    END BEFORE EACH ROW;

    AFTER EACH ROW IS
        v_old_value CLOB;
        v_new_value CLOB;
    BEGIN
        IF v_is_weekday OR v_is_holiday THEN
            RETURN;
        END IF;

        IF UPDATING THEN
            v_old_value := 'OrderID=' || :OLD.OrderID || ',' || 'CustomerID=' || :OLD.CustomerID || ',' || 'OrderDate=' || TO_CHAR(:OLD.OrderDate, 'DD-MON-YYYY') || ',' || 'OrderStatus=' || :OLD.OrderStatus || ',' || 'ShippingAddress=' || :OLD.ShippingAddress || ',' || 'Priority=' || :OLD.Priority;
            v_new_value := 'OrderID=' || :NEW.OrderID || ',' || 'CustomerID=' || :NEW.CustomerID || ',' || 'OrderDate=' || TO_CHAR(:NEW.OrderDate, 'DD-MON-YYYY') || ',' || 'OrderStatus=' || :NEW.OrderStatus || ',' || 'ShippingAddress=' || :NEW.ShippingAddress || ',' || 'Priority=' || :NEW.Priority;
        ELSIF INSERTING THEN
            v_new_value := 'OrderID=' || :NEW.OrderID || ',' || 'CustomerID=' || :NEW.CustomerID || ',' || 'OrderDate=' || TO_CHAR(:NEW.OrderDate, 'DD-MON-YYYY') || ',' || 'OrderStatus=' || :NEW.OrderStatus || ',' || 'ShippingAddress=' || :NEW.ShippingAddress || ',' || 'Priority=' || :NEW.Priority;
        ELSIF DELETING THEN
            v_old_value := 'OrderID=' || :OLD.OrderID || ',' || 'CustomerID=' || :OLD.CustomerID || ',' || 'OrderDate=' || TO_CHAR(:OLD.OrderDate, 'DD-MON-YYYY') || ',' || 'OrderStatus=' || :OLD.OrderStatus || ',' || 'ShippingAddress=' || :OLD.ShippingAddress || ',' || 'Priority=' || :OLD.Priority;
        END IF;

        INSERT INTO OrderAuditLog (
            UserID, TableName, ActionType, 
            RecordID, OldValue, NewValue, Status
        ) VALUES (
            v_user, 'ORDERS', v_action,
            COALESCE(:NEW.OrderID, :OLD.OrderID), v_old_value, v_new_value, 'SUCCESS'
        );
    END AFTER EACH ROW;
END OrderProcessingRestrictions;
/
```

---

## 🚚 4. Trigger: Delivery Status Audit

```sql
CREATE OR REPLACE TRIGGER AuditDeliveryChanges
BEFORE UPDATE OF DeliveryStatus ON Deliveries
FOR EACH ROW
DECLARE
    v_user VARCHAR2(100) := USER;
BEGIN
    INSERT INTO OrderAuditLog (
        UserID, TableName, ActionType, 
        RecordID, OldValue, NewValue, Status
    ) VALUES (
        v_user, 'DELIVERIES', 'UPDATE',
        :OLD.DeliveryID, 
        'Status=' || :OLD.DeliveryStatus, 
        'Status=' || :NEW.DeliveryStatus, 
        'SUCCESS'
    );
END;
/
```

---

## 📦 5. Package: `AuditReporting`

### Specification:

```sql
CREATE OR REPLACE PACKAGE AuditReporting AS
    PROCEDURE GetRestrictedAttempts(p_start_date IN DATE DEFAULT NULL, p_end_date IN DATE DEFAULT NULL);
    PROCEDURE GetOrderAuditTrail(p_order_id IN Orders.OrderID%TYPE);
    PROCEDURE GetHolidaySchedule(p_year IN NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE));
END AuditReporting;
/
```

### Body:

```sql
CREATE OR REPLACE PACKAGE BODY AuditReporting AS
    PROCEDURE GetRestrictedAttempts(p_start_date IN DATE DEFAULT NULL, p_end_date IN DATE DEFAULT NULL) IS
        CURSOR audit_cur IS
            SELECT * FROM OrderAuditLog
            WHERE Status = 'RESTRICTED'
              AND (p_start_date IS NULL OR ActionDate >= p_start_date)
              AND (p_end_date IS NULL OR ActionDate <= p_end_date + 1)
            ORDER BY ActionDate DESC;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('RESTRICTED ORDER ATTEMPTS');
        FOR rec IN audit_cur LOOP
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(rec.ActionDate, 'DD-MON-YYYY HH24:MI') || ' | ' || rec.UserID || ' | ' || rec.ActionType || ' | ' || rec.Comments);
        END LOOP;
    END;

    PROCEDURE GetOrderAuditTrail(p_order_id IN Orders.OrderID%TYPE) IS
        CURSOR audit_cur IS
            SELECT * FROM OrderAuditLog
            WHERE TableName = 'ORDERS'
              AND RecordID = p_order_id
            ORDER BY ActionDate DESC;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('AUDIT TRAIL FOR ORDER #' || p_order_id);
        FOR rec IN audit_cur LOOP
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(rec.ActionDate, 'DD-MON-YYYY HH24:MI') || ' | ' || rec.UserID || ' | ' || rec.ActionType || ' | ' || rec.Status);
        END LOOP;
    END;

    PROCEDURE GetHolidaySchedule(p_year IN NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE)) IS
        CURSOR holiday_cur IS
            SELECT * FROM PublicHolidays
            WHERE EXTRACT(YEAR FROM HolidayDate) = p_year
            ORDER BY HolidayDate;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('PUBLIC HOLIDAYS FOR ' || p_year);
        FOR rec IN holiday_cur LOOP
            DBMS_OUTPUT.PUT_LINE(TO_CHAR(rec.HolidayDate, 'DD-MON-YYYY') || ' | ' || rec.HolidayName || ' | ' || rec.Description);
        END LOOP;
    END;
END AuditReporting;
/
```

---

## 🧪 6. Testing

### Check Today’s Day:

```sql
SELECT TO_CHAR(SYSDATE, 'DY') AS Today, 
       TO_NUMBER(TO_CHAR(SYSDATE, 'D')) AS DayNumber 
FROM dual;
```

### Attempt Restricted Operation:

```sql
BEGIN
    UPDATE Orders SET Priority = 'High' WHERE OrderID = 1;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/
```

### Audit Reports:

```sql
EXEC AuditReporting.GetRestrictedAttempts;
EXEC AuditReporting.GetOrderAuditTrail(1);
EXEC AuditReporting.GetHolidaySchedule(2025);
```

---
### "Whatever you do, work at it with all your heart, as working for the Lord, not for human masters.” ###
                                 ~~Colossians 3:23 (NIV)~~
                            
```
### THANK YOU ###







