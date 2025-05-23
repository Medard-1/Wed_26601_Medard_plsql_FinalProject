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












