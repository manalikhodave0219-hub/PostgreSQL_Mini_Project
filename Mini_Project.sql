CREATE TABLE Customers (
    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Region VARCHAR(20)
);

CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    Sales DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName, City, Region) VALUES 
('C011', 'Rahul Mehta', 'Pune', 'West'),
('C012', 'Ananya Rao', 'Chennai', 'South'),
('C013', 'Devika Shah', 'Nashik', 'West'),
('C014', 'Amit Sharma', 'Delhi', 'North'),
('C015', 'Priya Patel', 'Kolkata', 'East'),
('C016', 'Suresh Kumar', 'Mumbai', 'West'),
('C017', 'Sneha Verma', 'Jaipur', 'North'),
('C018', 'Rohan Kulkarni', 'Nagpur', 'West'),
('C019', 'Pooja Joshi', 'Bangalore', 'South'),
('C020', 'Vikram Singh', 'Lucknow', 'North');

select * from Customers;

INSERT INTO Products (ProductID, ProductName, Category, UnitPrice) VALUES 
('P001', 'Laptop', 'Electronics', 60000.00),
('P002', 'Mouse', 'Accessories', 900.00),
('P003', 'Keyboard', 'Accessories', 2000.00),
('P004', 'Monitor', 'Electronics', 15000.00),
('P005', 'Headphones', 'Accessories', 3500.00),
('P006', 'Webcam', 'Electronics', 4500.00),
('P007', 'USB Cable', 'Accessories', 450.00),
('P008', 'Pen Drive', 'Accessories', 800.00),
('P009', 'Tablet', 'Electronics', 25000.00),
('P010', 'Speaker', 'Electronics', 5500.00);

select * from Products;

INSERT INTO Orders (OrderID, OrderDate, CustomerID, ProductID, Quantity, Sales) VALUES 
(0011, '2026-08-01', 'C011', 'P001', 2, 120000.00),
(0012, '2026-08-02', 'C012', 'P002', 5, 4500.00),
(0013, '2026-08-02', 'C013', 'P003', 3, 6000.00),
(0014, '2026-08-03', 'C014', 'P004', 1, 900.00),
(0015, '2026-08-03', 'C015', 'P005', 1, 60000.00),
(0016, '2026-08-04', 'C016', 'P006', 2, 4000.00),
(0017, '2026-08-04', 'C017', 'P007', 1, 3500.00),
(0018, '2026-08-05', 'C018', 'P008', 4, 3600.00),
(0019, '2026-08-05', 'C019', 'P009', 2, 9000.00),
(0020, '2026-08-06', 'C020', 'P010', 1, 25000.00);

select * from Orders;

SELECT
    o.orderid,
    o.orderdate,
    c.customername,
    c.region,
    p.productname,
    p.category,
    o.quantity,
    o.sales
FROM Orders o
INNER JOIN Customers c
    ON o.customerid = c.customerid
INNER JOIN Products p
    ON o.productid = p.productid;

SELECT
    SUM(sales) AS TotalSales,
    COUNT(orderid) AS TotalOrders,
    AVG(sales) AS AverageOrderValue,
    MAX(sales) AS HighestOrderValue
FROM Orders;

SELECT
    c.region,
    p.category,
    SUM(o.sales) AS TotalSales
FROM Orders o
INNER JOIN Customers c
    ON o.customerid = c.customerid
INNER JOIN Products p
    ON o.productid = p.productid
GROUP BY c.region, p.category
ORDER BY TotalSales DESC;

SELECT
    DATE_TRUNC('month', orderdate) AS Month,
    SUM(sales) AS TotalSales
FROM Orders
GROUP BY DATE_TRUNC('month', orderdate)
ORDER BY Month;

SELECT
    p.productname,
    SUM(o.sales) AS TotalSales
FROM Orders o
INNER JOIN Products p
    ON o.productid = p.productid
GROUP BY p.productname
ORDER BY TotalSales DESC
LIMIT 5;

SELECT
    c.customername AS Salesperson,
    SUM(o.sales) AS TotalSales
FROM Orders o
INNER JOIN Customers c
    ON o.customerid = c.customerid
GROUP BY c.customername
ORDER BY TotalSales DESC
LIMIT 5;

