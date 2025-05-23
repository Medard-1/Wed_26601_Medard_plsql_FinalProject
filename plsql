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

-- INVENTORY
CREATE TABLE Inventory (
    InventoryID         NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductID           NUMBER NOT NULL,
    WarehouseLocation   VARCHAR2(100) NOT NULL,
    StockLevel          NUMBER DEFAULT 0 CHECK (StockLevel >= 0),
    CONSTRAINT fk_inventory_product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- ORDERS
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


-- DDL Operations (Adding a new column to track order priority)
ALTER TABLE Orders ADD Priority VARCHAR2(10) CHECK (Priority IN ('Low', 'Medium', 'High'));

-- DML Operations
-- Update existing orders with priority
UPDATE Orders SET Priority = 
  CASE 
    WHEN OrderID BETWEEN 1 AND 3 THEN 'High'
    WHEN OrderID BETWEEN 4 AND 7 THEN 'Medium'
    ELSE 'Low'
  END;

-- Delete test data (if any)
DELETE FROM Orders WHERE OrderStatus = 'Test';
```

### 2. Window Functions for Analytics

```sql
-- Analyze customer purchasing patterns with window functions
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
JOIN 
  Orders o ON c.CustomerID = o.CustomerID
JOIN 
  OrderDetails od ON o.OrderID = od.OrderID
JOIN 
  Products p ON od.ProductID = p.ProductID
GROUP BY 
  c.CustomerID, c.FirstName, c.LastName, o.OrderID, o.OrderDate;
```

### 3. Parameterized Procedures with Cursors

```sql
-- Create a procedure to get customer orders with cursor
CREATE OR REPLACE PROCEDURE GetCustomerOrders(
  p_CustomerID IN Customers.CustomerID%TYPE
) AS
  CURSOR order_cursor IS
    SELECT o.OrderID, o.OrderDate, o.OrderStatus, COUNT(d.DeliveryID) AS DeliveryCount
    FROM Orders o
    LEFT JOIN Deliveries d ON o.OrderID = d.OrderID
    WHERE o.CustomerID = p_CustomerID
    GROUP BY o.OrderID, o.OrderDate, o.OrderStatus;
    
  v_order_rec order_cursor%ROWTYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Orders for Customer ID: ' || p_CustomerID);
  DBMS_OUTPUT.PUT_LINE('--------------------------------');
  
  OPEN order_cursor;
  LOOP
    FETCH order_cursor INTO v_order_rec;
    EXIT WHEN order_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_rec.OrderID);
    DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_order_rec.OrderDate, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Status: ' || v_order_rec.OrderStatus);
    DBMS_OUTPUT.PUT_LINE('Delivery Attempts: ' || v_order_rec.DeliveryCount);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
  END LOOP;
  CLOSE order_cursor;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No orders found for this customer.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END GetCustomerOrders;
/

-- Test the procedure
EXEC GetCustomerOrders(1);
```

### 4. Functions for Business Logic

```sql
-- Create a function to calculate delivery fee based on distance
CREATE OR REPLACE FUNCTION CalculateDeliveryFee(
  p_DistanceKM IN NUMBER,
  p_OrderValue IN NUMBER
) RETURN NUMBER IS
  v_BaseFee NUMBER := 1500; -- Base delivery fee in RWF
  v_DistanceFee NUMBER;
  v_TotalFee NUMBER;
BEGIN
  -- Distance-based fee (500 RWF per km beyond 5km)
  IF p_DistanceKM <= 5 THEN
    v_DistanceFee := 0;
  ELSE
    v_DistanceFee := (p_DistanceKM - 5) * 500;
  END IF;
  
  -- Discount for high-value orders (free delivery for orders > 50,000 RWF)
  IF p_OrderValue > 50000 THEN
    v_TotalFee := 0;
  ELSE
    v_TotalFee := v_BaseFee + v_DistanceFee;
  END IF;
  
  RETURN v_TotalFee;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;
END CalculateDeliveryFee;
/

-- Test the function
SELECT CalculateDeliveryFee(10, 25000) AS DeliveryFee FROM dual;
```

### 5. Package Implementation

```sql
-- Create a package for order management
CREATE OR REPLACE PACKAGE OrderManagement AS
  -- Procedure to place a new order
  PROCEDURE PlaceNewOrder(
    p_CustomerID IN Orders.CustomerID%TYPE,
    p_ShippingAddress IN Orders.ShippingAddress%TYPE,
    p_Priority IN Orders.Priority%TYPE DEFAULT 'Medium'
  );
  
  -- Function to check product availability
  FUNCTION CheckProductStock(
    p_ProductID IN Products.ProductID%TYPE,
    p_Quantity IN NUMBER
  ) RETURN BOOLEAN;
  
  -- Procedure to update order status
  PROCEDURE UpdateOrderStatus(
    p_OrderID IN Orders.OrderID%TYPE,
    p_NewStatus IN Orders.OrderStatus%TYPE
  );
END OrderManagement;
/

CREATE OR REPLACE PACKAGE BODY OrderManagement AS
  PROCEDURE PlaceNewOrder(
    p_CustomerID IN Orders.CustomerID%TYPE,
    p_ShippingAddress IN Orders.ShippingAddress%TYPE,
    p_Priority IN Orders.Priority%TYPE DEFAULT 'Medium'
  ) IS
    v_OrderID Orders.OrderID%TYPE;
  BEGIN
    -- Insert the new order
    INSERT INTO Orders (CustomerID, ShippingAddress, Priority)
    VALUES (p_CustomerID, p_ShippingAddress, p_Priority)
    RETURNING OrderID INTO v_OrderID;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('New order created with ID: ' || v_OrderID);
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error creating order: ' || SQLERRM);
  END PlaceNewOrder;
  
  FUNCTION CheckProductStock(
    p_ProductID IN Products.ProductID%TYPE,
    p_Quantity IN NUMBER
  ) RETURN BOOLEAN IS
    v_Stock Products.StockQuantity%TYPE;
  BEGIN
    SELECT StockQuantity INTO v_Stock
    FROM Products
    WHERE ProductID = p_ProductID;
    
    RETURN v_Stock >= p_Quantity;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RETURN FALSE;
    WHEN OTHERS THEN
      RETURN FALSE;
  END CheckProductStock;
  
  PROCEDURE UpdateOrderStatus(
    p_OrderID IN Orders.OrderID%TYPE,
    p_NewStatus IN Orders.OrderStatus%TYPE
  ) IS
    v_CurrentStatus Orders.OrderStatus%TYPE;
  BEGIN
    -- Get current status
    SELECT OrderStatus INTO v_CurrentStatus
    FROM Orders
    WHERE OrderID = p_OrderID;
    
    -- Validate status transition
    IF v_CurrentStatus = 'Cancelled' THEN
      DBMS_OUTPUT.PUT_LINE('Cannot update a cancelled order.');
    ELSIF v_CurrentStatus = 'Delivered' AND p_NewStatus != 'Delivered' THEN
      DBMS_OUTPUT.PUT_LINE('Cannot change status from Delivered.');
    ELSE
      -- Update the status
      UPDATE Orders
      SET OrderStatus = p_NewStatus
      WHERE OrderID = p_OrderID;
      
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Order ' || p_OrderID || ' status updated to ' || p_NewStatus);
    END IF;
  EXCEPTION
    WHEN OTHERS THEN
      ROLLBACK;
      DBMS_OUTPUT.PUT_LINE('Error updating order status: ' || SQLERRM);
  END UpdateOrderStatus;
END OrderManagement;
/

-- Test the package
BEGIN
  -- Test placing a new order
  OrderManagement.PlaceNewOrder(1, 'KN 45 St, Kigali', 'High');
  
  -- Test product stock check
  IF OrderManagement.CheckProductStock(1, 5) THEN
    DBMS_OUTPUT.PUT_LINE('Product is available in stock');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Product is not available in sufficient quantity');
  END IF;
  
  -- Test order status update
  OrderManagement.UpdateOrderStatus(1, 'Processing');
END;
/
```

### 6. Exception Handling Demonstration

```sql
-- Procedure with comprehensive exception handling
CREATE OR REPLACE PROCEDURE ProcessDelivery(
  p_DeliveryID IN Deliveries.DeliveryID%TYPE,
  p_NewStatus IN Deliveries.DeliveryStatus%TYPE
) AS
  v_CurrentStatus Deliveries.DeliveryStatus%TYPE;
  v_OrderStatus Orders.OrderStatus%TYPE;
  v_InvalidTransition EXCEPTION;
  v_OrderID Orders.OrderID%TYPE;
BEGIN
  -- Get current delivery and order status
  BEGIN
    SELECT d.DeliveryStatus, o.OrderStatus, d.OrderID
    INTO v_CurrentStatus, v_OrderStatus, v_OrderID
    FROM Deliveries d
    JOIN Orders o ON d.OrderID = o.OrderID
    WHERE d.DeliveryID = p_DeliveryID;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      RAISE_APPLICATION_ERROR(-20001, 'Delivery ID ' || p_DeliveryID || ' not found');
  END;
  
  -- Validate status transition
  IF v_CurrentStatus = 'Delivered' THEN
    RAISE v_InvalidTransition;
  ELSIF v_CurrentStatus = 'Failed' AND p_NewStatus = 'In Transit' THEN
    RAISE v_InvalidTransition;
  ELSIF v_OrderStatus = 'Cancelled' AND p_NewStatus != 'Failed' THEN
    RAISE_APPLICATION_ERROR(-20002, 'Cannot process delivery for cancelled order');
  END IF;
  
  -- Update delivery status
  UPDATE Deliveries
  SET DeliveryStatus = p_NewStatus,
      DeliveryDate = CASE WHEN p_NewStatus = 'Delivered' THEN SYSDATE ELSE DeliveryDate END
  WHERE DeliveryID = p_DeliveryID;
  
  -- If delivered, update order status
  IF p_NewStatus = 'Delivered' THEN
    UPDATE Orders
    SET OrderStatus = 'Delivered'
    WHERE OrderID = v_OrderID;
  END IF;
  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Delivery ' || p_DeliveryID || ' status updated to ' || p_NewStatus);
EXCEPTION
  WHEN v_InvalidTransition THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Invalid status transition from ' || v_CurrentStatus || ' to ' || p_NewStatus);
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error processing delivery: ' || SQLERRM);
END ProcessDelivery;
/

-- Test the procedure with different scenarios
BEGIN
  -- Valid transition
  ProcessDelivery(1, 'In Transit');
  
  -- Invalid transition (assuming delivery 1 is now 'In Transit')
  ProcessDelivery(1, 'Assigned');
  
  -- Non-existent delivery
  ProcessDelivery(999, 'Delivered');
END;
/


## Testing Plan

1. **Window Functions Test**:
   - Execute the analytical query to verify customer purchasing patterns
   - Check rankings and aggregations are correct

2. **Procedure Tests**:
   - Call `GetCustomerOrders` with valid and invalid customer IDs
   - Verify output matches database state

3. **Function Tests**:
   - Test `CalculateDeliveryFee` with various distances and order values
   - Verify calculations match business rules

4. **Package Tests**:
   - Test all procedures in the `OrderManagement` package
   - Verify order placement, stock checking, and status updates work correctly

5. **Exception Handling Tests**:
   - Test `ProcessDelivery` with valid and invalid status transitions
   - Verify proper error messages for exceptional cases

## GitHub Documentation

For the GitHub report, I would include:

1. All SQL scripts shown above in separate files:
   - `window_functions.sql`
   - `procedures_functions.sql`
   - `order_management_package.sql`
   - `exception_handling.sql`

2. Screenshots of:
   - Execution results of the window functions query
   - Successful procedure executions
   - Error handling scenarios

3. A README.md explaining:
   - Purpose of each component
   - How to test the implementation
   - Business rules enforced

This implementation covers all requirements for Phase VI, demonstrating database interaction through DML/DDL operations, window functions for analytics, parameterized procedures with cursors, comprehensive exception handling, and package implementation for modular programming.

Phase 7
Problem Statement:
Our e-commerce system needs to enforce business rules around order processing times and maintain comprehensive audit trails for security and compliance. Specifically:

Prevent order modifications during weekdays (Monday-Friday) to align with our weekend-only processing schedule

Block operations during public holidays to respect national observances

Track all sensitive operations for accountability and troubleshooting
-- Create holiday reference table
CREATE TABLE PublicHolidays (
    HolidayID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    HolidayName VARCHAR2(100) NOT NULL,
    HolidayDate DATE NOT NULL,
    Description VARCHAR2(255),
    UNIQUE (HolidayDate)
);

-- Insert upcoming month's holidays (example for Rwanda)
INSERT INTO PublicHolidays (HolidayName, HolidayDate, Description) VALUES 
('Liberation Day', TO_DATE('04-JUL-2025', 'DD-MON-YYYY'), 'Celebration of the end of the 1994 genocide');
INSERT INTO PublicHolidays (HolidayName, HolidayDate, Description) VALUES 
('Assumption Day', TO_DATE('15-AUG-2025', 'DD-MON-YYYY'), 'Feast of the Assumption of Mary');
INSERT INTO PublicHolidays (HolidayName, HolidayDate, Description) VALUES 
('Heroes Day', TO_DATE('01-FEB-2025', 'DD-MON-YYYY'), 'Day honoring national heroes');

-- Create audit table
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

-- Create sequence for audit IDs (if not using identity column)
CREATE SEQUENCE audit_seq START WITH 1 INCREMENT BY 1;

-- Create compound trigger to enforce restrictions and audit changes
CREATE OR REPLACE TRIGGER OrderProcessingRestrictions
FOR INSERT OR UPDATE OR DELETE ON Orders
COMPOUND TRIGGER
    -- Variables to track restrictions
    v_is_weekday BOOLEAN := FALSE;
    v_is_holiday BOOLEAN := FALSE;
    v_restriction_message VARCHAR2(255);
    v_action VARCHAR2(10);
    v_user VARCHAR2(100);
    
    -- Before statement section - check day and holidays
    BEFORE STATEMENT IS
    BEGIN
        -- Check if today is a weekday (1-5 = Monday-Friday)
        IF TO_NUMBER(TO_CHAR(SYSDATE, 'D')) BETWEEN 2 AND 6 THEN
            v_is_weekday := TRUE;
        END IF;
        
        -- Check if today is a holiday in our reference table
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
        
        -- Determine current action
        IF INSERTING THEN
            v_action := 'INSERT';
        ELSIF UPDATING THEN
            v_action := 'UPDATE';
        ELSIF DELETING THEN
            v_action := 'DELETE';
        END IF;
        
        -- Get current user
        v_user := USER;
    END BEFORE STATEMENT;
    
    -- Before each row - enforce restrictions
    BEFORE EACH ROW IS
    BEGIN
        IF v_is_weekday OR v_is_holiday THEN
            IF v_is_weekday THEN
                v_restriction_message := 'Order modifications not allowed on weekdays (Monday-Friday)';
            ELSE
                v_restriction_message := 'Order modifications not allowed on public holidays';
            END IF;
            
            -- Log the restricted attempt
            INSERT INTO OrderAuditLog (
                UserID, TableName, ActionType, 
                RecordID, Status, Comments
            ) VALUES (
                v_user, 'ORDERS', v_action,
                :NEW.OrderID, 'RESTRICTED', v_restriction_message
            );
            
            -- Raise application error to prevent the operation
            RAISE_APPLICATION_ERROR(-20001, v_restriction_message);
        END IF;
    END BEFORE EACH ROW;
    
    -- After each row - log successful changes
    AFTER EACH ROW IS
        v_old_value CLOB;
        v_new_value CLOB;
    BEGIN
        -- Skip if operation was restricted
        IF v_is_weekday OR v_is_holiday THEN
            RETURN;
        END IF;
        
        -- Prepare old and new values for audit
        IF UPDATING THEN
            v_old_value := 
                'OrderID=' || :OLD.OrderID || ',' ||
                'CustomerID=' || :OLD.CustomerID || ',' ||
                'OrderDate=' || TO_CHAR(:OLD.OrderDate, 'DD-MON-YYYY') || ',' ||
                'OrderStatus=' || :OLD.OrderStatus || ',' ||
                'ShippingAddress=' || :OLD.ShippingAddress || ',' ||
                'Priority=' || :OLD.Priority;
                
            v_new_value := 
                'OrderID=' || :NEW.OrderID || ',' ||
                'CustomerID=' || :NEW.CustomerID || ',' ||
                'OrderDate=' || TO_CHAR(:NEW.OrderDate, 'DD-MON-YYYY') || ',' ||
                'OrderStatus=' || :NEW.OrderStatus || ',' ||
                'ShippingAddress=' || :NEW.ShippingAddress || ',' ||
                'Priority=' || :NEW.Priority;
        ELSIF INSERTING THEN
            v_new_value := 
                'OrderID=' || :NEW.OrderID || ',' ||
                'CustomerID=' || :NEW.CustomerID || ',' ||
                'OrderDate=' || TO_CHAR(:NEW.OrderDate, 'DD-MON-YYYY') || ',' ||
                'OrderStatus=' || :NEW.OrderStatus || ',' ||
                'ShippingAddress=' || :NEW.ShippingAddress || ',' ||
                'Priority=' || :NEW.Priority;
        ELSIF DELETING THEN
            v_old_value := 
                'OrderID=' || :OLD.OrderID || ',' ||
                'CustomerID=' || :OLD.CustomerID || ',' ||
                'OrderDate=' || TO_CHAR(:OLD.OrderDate, 'DD-MON-YYYY') || ',' ||
                'OrderStatus=' || :OLD.OrderStatus || ',' ||
                'ShippingAddress=' || :OLD.ShippingAddress || ',' ||
                'Priority=' || :OLD.Priority;
        END IF;
        
        -- Log the successful operation
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

-- Create trigger for delivery status changes
CREATE OR REPLACE TRIGGER AuditDeliveryChanges
BEFORE UPDATE OF DeliveryStatus ON Deliveries
FOR EACH ROW
DECLARE
    v_user VARCHAR2(100) := USER;
BEGIN
    -- Log the status change attempt
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

-- Create package for audit reporting
CREATE OR REPLACE PACKAGE AuditReporting AS
    -- Get all restricted attempts
    PROCEDURE GetRestrictedAttempts(
        p_start_date IN DATE DEFAULT NULL,
        p_end_date IN DATE DEFAULT NULL
    );
    
    -- Get all changes for a specific order
    PROCEDURE GetOrderAuditTrail(
        p_order_id IN Orders.OrderID%TYPE
    );
    
    -- Get holiday schedule
    PROCEDURE GetHolidaySchedule(
        p_year IN NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE)
    );
END AuditReporting;
/

CREATE OR REPLACE PACKAGE BODY AuditReporting AS
    PROCEDURE GetRestrictedAttempts(
        p_start_date IN DATE DEFAULT NULL,
        p_end_date IN DATE DEFAULT NULL
    ) IS
        CURSOR audit_cur IS
            SELECT *
            FROM OrderAuditLog
            WHERE Status = 'RESTRICTED'
            AND (p_start_date IS NULL OR ActionDate >= p_start_date)
            AND (p_end_date IS NULL OR ActionDate <= p_end_date + 1)
            ORDER BY ActionDate DESC;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('RESTRICTED ORDER ATTEMPTS');
        DBMS_OUTPUT.PUT_LINE('------------------------');
        DBMS_OUTPUT.PUT_LINE(RPAD('Date', 20) || RPAD('User', 15) || RPAD('Action', 10) || 'Comments');
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 70, '-'));
        
        FOR rec IN audit_cur LOOP
            DBMS_OUTPUT.PUT_LINE(
                RPAD(TO_CHAR(rec.ActionDate, 'DD-MON-YYYY HH24:MI'), 20) ||
                RPAD(rec.UserID, 15) ||
                RPAD(rec.ActionType, 10) ||
                rec.Comments
            );
        END LOOP;
    END GetRestrictedAttempts;
    
    PROCEDURE GetOrderAuditTrail(
        p_order_id IN Orders.OrderID%TYPE
    ) IS
        CURSOR audit_cur IS
            SELECT *
            FROM OrderAuditLog
            WHERE TableName = 'ORDERS'
            AND RecordID = p_order_id
            ORDER BY ActionDate DESC;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('AUDIT TRAIL FOR ORDER #' || p_order_id);
        DBMS_OUTPUT.PUT_LINE('------------------------');
        DBMS_OUTPUT.PUT_LINE(RPAD('Date', 20) || RPAD('User', 15) || RPAD('Action', 10) || 'Details');
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 70, '-'));
        
        FOR rec IN audit_cur LOOP
            DBMS_OUTPUT.PUT_LINE(
                RPAD(TO_CHAR(rec.ActionDate, 'DD-MON-YYYY HH24:MI'), 20) ||
                RPAD(rec.UserID, 15) ||
                RPAD(rec.ActionType, 10) ||
                CASE 
                    WHEN rec.Status = 'RESTRICTED' THEN rec.Comments
                    WHEN rec.OldValue IS NULL THEN 'Created: ' || rec.NewValue
                    WHEN rec.NewValue IS NULL THEN 'Deleted: ' || rec.OldValue
                    ELSE 'Updated: ' || rec.OldValue || ' -> ' || rec.NewValue
                END
            );
        END LOOP;
    END GetOrderAuditTrail;
    
    PROCEDURE GetHolidaySchedule(
        p_year IN NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE)
    ) IS
        CURSOR holiday_cur IS
            SELECT HolidayName, HolidayDate, Description
            FROM PublicHolidays
            WHERE EXTRACT(YEAR FROM HolidayDate) = p_year
            ORDER BY HolidayDate;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('PUBLIC HOLIDAYS FOR ' || p_year);
        DBMS_OUTPUT.PUT_LINE('------------------------');
        DBMS_OUTPUT.PUT_LINE(RPAD('Date', 15) || RPAD('Holiday', 25) || 'Description');
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 70, '-'));
        
        FOR rec IN holiday_cur LOOP
            DBMS_OUTPUT.PUT_LINE(
                RPAD(TO_CHAR(rec.HolidayDate, 'DD-MON-YYYY'), 15) ||
                RPAD(rec.HolidayName, 25) ||
                rec.Description
            );
        END LOOP;
    END GetHolidaySchedule;
END AuditReporting;
/

-- Test 1: Try to modify orders on a weekday (simulated)
-- First, check current day
SELECT TO_CHAR(SYSDATE, 'DY') AS Today, 
       TO_NUMBER(TO_CHAR(SYSDATE, 'D')) AS DayNumber 
FROM dual;

-- Attempt to update an order (should fail if it's a weekday)
BEGIN
    UPDATE Orders SET Priority = 'High' WHERE OrderID = 1;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;
/

-- Test 2: View restricted attempts
EXEC AuditReporting.GetRestrictedAttempts;

-- Test 3: View order audit trail
EXEC AuditReporting.GetOrderAuditTrail(1);

-- Test 4: View holiday schedule
EXEC AuditReporting.GetHolidaySchedule(2025);

-- Test 5: Simulate a weekend operation (if possible)
-- You would need to run this on a weekend or temporarily modify the trigger
-- to test the weekend allowance functionality

-- Test 6: Verify delivery status changes are audited
UPDATE Deliveries SET DeliveryStatus = 'In Transit' WHERE DeliveryID = 1;
COMMIT;

-- Check the audit log for the delivery update
SELECT * FROM OrderAuditLog WHERE TableName = 'DELIVERIES' ORDER BY ActionDate DESC;

COMMIT;
