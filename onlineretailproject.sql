CREATE DATABASE OnlineRetail;
USE OnlineRetail; 

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Order_Items (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Customers
INSERT INTO Customers (Name, Email, Phone, Address) VALUES
('Amit Sharma', 'amit@gmail.com', '9876543210', 'Delhi'),
('Riya Gupta', 'riya@gmail.com', '9123456780', 'Mumbai');

-- Products
INSERT INTO Products (Name, Category, Price, Stock) VALUES
('Laptop', 'Electronics', 55000, 10),
('Mobile', 'Electronics', 20000, 25);

-- Orders
INSERT INTO Orders (CustomerID, OrderDate, Status) VALUES
(1, '2025-09-01', 'Shipped'),
(2, '2025-09-02', 'Pending');

-- Order_Items
INSERT INTO Order_Items (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 55000),
(2, 2, 2, 40000);

-- Payments (ab chalega, kyunki Orders 1 aur 2 exist karte hain)
INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod, Status) VALUES
(1, '2025-09-01', 55000, 'Credit Card', 'Paid'),
(2, '2025-09-02', 40000, 'UPI', 'Pending');
SELECT c.Name, o.OrderID, o.OrderDate, o.Status
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;
SELECT o.OrderID, p.Name AS Product, oi.Quantity, oi.Price
FROM Orders o
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;
CREATE VIEW SalesReport AS
SELECT c.Name, o.OrderID, p.Name AS Product, oi.Quantity, oi.Price, pay.Status AS PaymentStatus
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Order_Items oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID
JOIN Payments pay ON o.OrderID = pay.OrderID;
SELECT * FROM SalesReport;
SELECT Name, SUM(oi.Price * oi.Quantity) AS TotalSpent
FROM SalesReport sr
JOIN Order_Items oi ON sr.OrderID = oi.OrderID
GROUP BY Name;


