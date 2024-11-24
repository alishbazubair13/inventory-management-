Inventory Management System
This project is a SQL Server-based inventory management system designed to track inventory levels, suppliers, and orders. It includes features like data validation, automated inventory updates, and analytical views for effective decision-making.

  Project Overview
Start Date: November 22, 2024
End Date: November 25, 2024
Technologies Used:
Microsoft SQL Server
SQL (Structured Query Language)
Features
    Database Design:

Tables for Products, Suppliers, and Orders.
ER diagram to establish relationships.
Relationships enforce referential integrity.
Data Insertion:


{{{Setup Instructions
Prerequisites
Install Microsoft SQL Server.
Install a SQL Server Management Tool (e.g., SSMS).
Database Setup
Create the Database:
Run the following command to create the database:
}}}}


Query Functionality:

Retrieve inventory levels, order history, and supplier details.
Calculate total inventory value and reorder requirements.
Analyze overdue orders and discontinued products.
Advanced Features:

Views for inventory and supplier performance analysis.

Stored procedures for efficient order management.

Triggers for automatic stock level updates.

Functions for reusable calculations like reorder levels.


   sql
  Copy code
  CREATE DATABASE InventoryManagement;  
  USE InventoryManagement;  
  Create Tables:
Execute the SQL script provided in the CreateTables.sql file to define the schema for:

Products
Suppliers
Orders
Insert Data:
Use the provided scripts (InsertData.sql) to populate the tables with sample data.
