CREATE DATABASE MakeupInventory;
GO
USE MakeupInventory;
GO
         --TABLE NO 1--PRODUCTSSS
		 GO
CREATE TABLE Products (
   ProductID INT IDENTITY(1,1) PRIMARY KEY,
   ProductName NVARCHAR(100) NOT NULL,
   Category NVARCHAR(50) NOT NULL,
   Brand NVARCHAR(50) NOT NULL,
   Price DECIMAL(10, 2) NOT NULL,
   StockLevel INT NOT NULL,
   ReorderLevel INT NOT NULL,
   Discontinued BIT DEFAULT 0,
   Shade NVARCHAR(50),
   SkinType NVARCHAR(50)
);
--------------------------------------------------------------
        --TABLE NO 2--Suppliers

		CREATE TABLE Suppliers (
   SupplierID INT IDENTITY(1,1) PRIMARY KEY,
   SupplierName NVARCHAR(100) NOT NULL,
   ContactInfo NVARCHAR(150),
   SuppliedCategories NVARCHAR(200)
);
--------------------------------------------------------------
         --TABLE NO 3-- ordersss

 CREATE TABLE Orders (
   OrderID INT IDENTITY(1,1) PRIMARY KEY,
   ProductID INT NOT NULL,
   SupplierID INT NOT NULL,
   OrderDate DATE NOT NULL,
   Quantity INT NOT NULL,
   OrderStatus NVARCHAR(50) DEFAULT 'Pending',
   ExpectedDelivery DATE,
   FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
   FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
--------------------------------------------------------------
--now insert into tables in sequences--

INSERT INTO Products (ProductName, Category, Brand, Price, StockLevel, ReorderLevel, Discontinued, Shade, SkinType)
VALUES
('Matte Lipstick', 'Lipstick', 'Chanel', 1200, 100, 20, 0, 'Ruby Red', 'All'),
('Liquid Foundation', 'Foundation', 'Dior', 1999, 50, 10, 0, 'Beige', 'Oily'),
('Eyeshadow Palette', 'Eyeshadow', 'Dior', 2550, 30, 5, 0, NULL, 'All'),
('Lip Gloss', 'Gloss', 'Yves Saint Laurent (YSL)', 2550, 30, 5, 0, 'Rose Gold', 'All'),
('Primer', 'Protector', 'MAC Cosmetics', 2550, 30, 5, 0, NULL, 'Dry'),
('Cream Concealer', 'Concealer', 'L’Oréal Paris', 2950, 30, 5, 0, NULL, 'All'),
('Liquid Blush', 'Blush', 'Miss Rose', 35.50, 30, 5, 0, 'Nude Shades', 'All'),
('Matte Bronzer', 'Bronzer', 'The Body Shop Pakistan', 15.50, 30, 5, 0, 'Matte Shades', 'All'),
('Volumizing Mascara', 'Mascara', 'Sana Safinaz Beauty', 55.50, 30, 5, 0, NULL, 'All'),
('Brow Pencils', 'Brow Pencils', 'Biby’s Cosmetics', 65.50, 30, 5, 0, 'Brown', 'All'),
('Tinted Lip Gloss', 'Lip Gloss', 'Makeup Revolution', 75.50, 30, 5, 0, NULL, 'All'),
('Nail Polishes', 'Nail Polishes', 'Etude House', 95.50, 30, 5, 0, 'Pink, Blue, Purple', 'All'),
('All-in-One Makeup Kits', 'Makeup Kits', 'Jeffree Star Cosmetics', 85.50, 30, 5, 0, NULL, 'All'),
('Matte Setting Spray', 'Setting Spray', 'The Body Shop Pakistan', 95.50, 30, 5, 0, NULL, 'All'),
('Dewy Setting Spray', 'Dewy Setting Spray', 'Makeup Revolution', 55.50, 30, 5, 0, NULL, 'All'),
('Satin Lipstick', 'Lipstick', 'Makeup Revolution', 35.50, 30, 5, 0, NULL, 'All'),
('Waterproof Mascara', 'Mascara', 'Makeup Revolution', 2350, 30, 5, 0, 'Black', 'All'),
('Liquid Eyeliner', 'Eyeliner', 'Makeup Revolution', 2900, 30, 5, 0, NULL, 'All'),
('Glitter Eyeshadow', 'Eyeshadow', 'The Body Shop Pakistan', 4550, 30, 5, 0, NULL, 'All'),
('Brow Powders', 'Brow Powders', 'The Body Shop Pakistan', 22450, 30, 5, 0, NULL, 'All'),
('Brow Gels', 'Brow Gels', 'The Body Shop Pakistan', 2850, 30, 5, 0, NULL, 'All'),
('Color Correcting Concealer', 'Concealer', 'L’Oréal Paris', 2590, 30, 5, 0, NULL, 'All'),
('Pressed Powder', 'Pressed Powder', 'Makeup Revolution', 2670, 30, 5, 0, NULL, 'All'),
('BB/CC Cream', 'Foundation', 'L’Oréal Paris', 1000, 30, 5, 0, 'Fair', 'All'),
('Sheer Lipstick', 'Lipstick', 'L’Oréal Paris', 9050, 30, 5, 0, NULL, 'All');
------------------------------------------------------------------------------------------------

		--supplies--
		INSERT INTO Suppliers (SupplierName, ContactInfo, SuppliedCategories)
VALUES
('Chanel', 'chanel@example.com', 'Lipstick'),
('Dior', 'dior@example.com', 'Foundation, Eyeshadow'),
('Yves Saint Laurent (YSL)', 'ysl@example.com', 'Lip Gloss'),
('MAC Cosmetics', 'mac@example.com', 'Primer'),
('L’Oréal Paris', 'loreal@example.com', 'Concealer, BB/CC Cream'),
('Miss Rose', 'missrose@example.com', 'Blush'),
('The Body Shop Pakistan', 'thebodyshop@example.com', 'Bronzer, Mascara, Eyeshadow, Setting Spray, Brow Powders, Brow Gels'),
('Sana Safinaz Beauty', 'sanasafinaz@example.com', 'Mascara'),
('Biby’s Cosmetics', 'bibyscosmetics@example.com', 'Brow Pencils'),
('Makeup Revolution', 'makeuprevolution@example.com', 'Lip Gloss, Mascara, Eyeliner, Eyeshadow, Setting Spray, Lipstick, Pressed Powder'),
('Jeffree Star Cosmetics', 'jeffreestar@example.com', 'Makeup Kits'),
('Etude House', 'etudehouse@example.com', 'Nail Polishes');

--------------------------------------------------------------------------------------------------------------------------------------------------

       --ordersssss--
		
		INSERT INTO Orders (ProductID, SupplierID, OrderDate, Quantity, OrderStatus, ExpectedDelivery)
VALUES
(1, 1, '2024-11-22', 50, 'Pending', '2024-11-30'),  -- Matte Lipstick, Chanel
(2, 2, '2024-11-20', 20, 'Shipped', '2024-11-27'),  -- Liquid Foundation, Dior
(3, 2, '2024-11-19', 15, 'Pending', '2024-11-26'),  -- Eyeshadow Palette, Dior
(4, 3, '2024-11-18', 30, 'Shipped', '2024-11-25'),  -- Lip Gloss, Yves Saint Laurent (YSL)
(5, 4, '2024-11-17', 25, 'Pending', '2024-11-24'),  -- Primer, MAC Cosmetics
(6, 5, '2024-11-16', 40, 'Shipped', '2024-11-23'),  -- Cream Concealer, L’Oréal Paris
(7, 6, '2024-11-15', 10, 'Pending', '2024-11-22'),  -- Liquid Blush, Miss Rose
(8, 7, '2024-11-14', 35, 'Shipped', '2024-11-21'),  -- Matte Bronzer, The Body Shop Pakistan
(9, 8, '2024-11-13', 60, 'Pending', '2024-11-20'),  -- Volumizing Mascara, Sana Safinaz Beauty
(10, 9, '2024-11-12', 55, 'Shipped', '2024-11-19'),  -- Brow Pencils, Biby’s Cosmetics
(11, 10, '2024-11-11', 45, 'Pending', '2024-11-18'),  -- Tinted Lip Gloss, Makeup Revolution
(12, 11, '2024-11-10', 25, 'Shipped', '2024-11-17'),  -- Nail Polishes, Etude House
(13, 12, '2024-11-09', 30, 'Pending', '2024-11-16'),  -- All-in-One Makeup Kits, Jeffree Star Cosmetics
(14, 7, '2024-11-08', 20, 'Shipped', '2024-11-15'),  -- Matte Setting Spray, The Body Shop Pakistan
(15, 10, '2024-11-07', 40, 'Pending', '2024-11-14'),  -- Dewy Setting Spray, Makeup Revolution
(16, 10, '2024-11-06', 60, 'Shipped', '2024-11-13'),  -- Satin Lipstick, Makeup Revolution
(17, 10, '2024-11-05', 55, 'Pending', '2024-11-12'),  -- Waterproof Mascara, Makeup Revolution
(18, 10, '2024-11-04', 25, 'Shipped', '2024-11-11'),  -- Liquid Eyeliner, Makeup Revolution
(19, 7, '2024-11-03', 30, 'Pending', '2024-11-10'),  -- Glitter Eyeshadow, The Body Shop Pakistan
(20, 7, '2024-11-02', 10, 'Shipped', '2024-11-09'),  -- Brow Powders, The Body Shop Pakistan
(21, 7, '2024-11-01', 45, 'Pending', '2024-11-08'),  -- Brow Gels, The Body Shop Pakistan
(22, 5, '2024-10-31', 35, 'Shipped', '2024-11-07'),  -- Color Correcting Concealer, L’Oréal Paris
(23, 10, '2024-10-30', 60, 'Pending', '2024-11-06'),  -- Pressed Powder, Makeup Revolution
(24, 5, '2024-10-29', 50, 'Shipped', '2024-11-05'),  -- BB/CC Cream, L’Oréal Paris
(25, 5, '2024-10-28', 20, 'Pending', '2024-11-04');  -- Sheer Lipstick, L’Oréal Paris

---------------------------------------------------------------------------------------------------------------

        --select SPECIFIC DATA IN products TABLE--
SELECT ProductName, Brand, StockLevel 
FROM Products;

--------------------------------------------------------------

        --List Products to Reorder--NOT OK
SELECT ProductName, StockLevel, ReorderLevel 
FROM Products 
WHERE StockLevel >= ReorderLevel;

--------------------------------------------------------------

-- Order History for a Specific Supplier--
SELECT o.OrderID, p.ProductName, o.Quantity, o.OrderDate 
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE o.SupplierID = 9; 

-------------------------------------------------------------

          --totals--
SELECT SUM(StockLevel * Price) AS TotalInventoryValue 
FROM Products;
---Retrieve All Suppliers with Overdue Orders--
SELECT s.SupplierName, o.OrderID, o.ExpectedDelivery 
FROM Suppliers s
JOIN Orders o ON s.SupplierID = o.SupplierID
WHERE o.ExpectedDelivery < GETDATE() AND o.OrderStatus != 'PENDING';
--. Retrieve Details of the Last Order Placed--
SELECT TOP 10 OrderID, ProductID, SupplierID, OrderDate, Quantity, OrderStatus 
FROM Orders 
ORDER BY OrderDate DESC;

-------------------------------------------------------------------------------------------
           
		   --check order between dates--
SELECT o.OrderID, p.ProductName, o.OrderDate, o.Quantity 
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '2024-11-04' AND '2024-11-05';


               --Inventory Status View--
GO
CREATE VIEW InventoryStatus AS
SELECT ProductName, Brand, StockLevel, 
       CASE 
          WHEN StockLevel >= ReorderLevel THEN 'Needs Reorder'
          ELSE 'Stock Sufficient'
       END AS Status
FROM Products;

SELECT * FROM InventoryStatus;

------------------------------------------------------------------------------------------

             --TRIGGERSS--
GO
CREATE TRIGGER UpdateStock
ON Orders
AFTER INSERT
AS
BEGIN
   UPDATE Products
   SET StockLevel = StockLevel - i.Quantity
   FROM Products p
   INNER JOIN inserted i ON p.ProductID = i.ProductID;
END;

--------------------------------------------------------------------------------------------

          --test this---
-- Insert a test order
INSERT INTO Orders (ProductID, SupplierID, OrderDate, Quantity, OrderStatus, ExpectedDelivery)
VALUES (1, 1, '2024-11-23', 10, 'Pending', '2024-11-30');

         -- Check if stock is updated
SELECT * FROM Products WHERE ProductID = 1;

---------------------------------------------------------------------------------------------

            --. Stored Procedure--
GO
CREATE PROCEDURE ReplenishStock
AS
BEGIN
   INSERT INTO Orders (ProductID, SupplierID, Quantity, OrderDate, OrderStatus, ExpectedDelivery)
   SELECT ProductID, 1, (ReorderLevel - StockLevel), GETDATE(), 'Pending', DATEADD(DAY, 7, GETDATE())
   FROM Products
   WHERE StockLevel <= ReorderLevel;
END;

---------------------------------------------------------------------------------------------

--SELECT * FROM Products;
SELECT * FROM Products;

---------------------------------------------------------------------------------------------

--SELECT * FROM Suppliers;
SELECT * FROM Suppliers;

---------------------------------------------------------------------------------------------

--order--
SELECT O.OrderID, P.ProductName, S.SupplierName, O.OrderDate, O.Quantity, O.OrderStatus, O.ExpectedDelivery
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
JOIN Suppliers S ON O.SupplierID = S.SupplierID;
-------------------------------------------------------------------------------------------------------------------------