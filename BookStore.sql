postgres=# CREATE DATABASE BookstoreDB;
CREATE DATABASE
postgres=# CREATE TABLE Books(
postgres(# BookID INT PRIMARY KEY,
postgres(# Title VARCHAR(100),
postgres(# Author VARCHAR(100),
postgres(# Genre VARCHAR(100),
postgres(# Price INT,
postgres(# QuantityInStock INT
postgres(# );
CREATE TABLE
postgres=# CREATE TABLE Customers(
postgres(# CustomerID INT PRIMARY KEY,
postgres(# Name VARCHAR(100),
postgres(# Email VARCHAR(100),
postgres(# Phone VARCHAR(100)
postgres(# );
CREATE TABLE
postgres=# CREATE TABLE Sales(
postgres(# SaleID INT PRIMARY KEY,
postgres(# BookID INT REFERENCES Books(BookID),
postgres(# CustomerID INT REFERENCES Customers(CUstomerID),
postgres(# DateOfSale DATE,
postgres(# QuantitySold INT,
postgres(# TotalPrice DECIMAL(10, 2)
postgres(# );
CREATE TABLE
postgres=# INSERT INTO Books(BookID, Title, Author, Genre, Price, QuantityInStock)
postgres-# VALUES (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 12.99, 50),
postgres-# (2, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 14.99, 30),
postgres-# (3, '1984', 'George Orwell', 'Dystopian', 9.99, 25),
postgres-# (4, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 16.99, 20),
postgres-# (5, 'Moby-Dick', 'Herman Melville', 'Adventure', 13.99, 15),
postgres-# (6, 'Pride and Prejudice', 'Jane Austen', 'Romance', 10.99, 40),
postgres-# (7, 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-age', 11.99, 35),
postgres-# (8, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 18.99, 60),
postgres-#  (9, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 22.99, 10),
postgres-#  (10, 'The Chronicles of Narnia', 'C.S. Lewis', 'Fantasy', 14.99, 28);
INSERT 0 10
postgres=# INSERT INTO Customers(CustomerID, Name, Email, Phone)
postgres-# VALUES  (1, 'Alice Johnson', 'alice@email.com', '+1234567890'),
postgres-# (2, 'Bob Smith', 'bob@email.com', '+1987654321'),
postgres-#  (3, 'Charlie Brown', 'charlie@email.com', '+1122334455'),
postgres-#  (4, 'Diana Miller', 'diana@email.com', '+1555666777'),
postgres-# (5, 'Eva Davis', 'eva@email.com', '+1444333222');
INSERT 0 5
postgres=# INSERT INTO Sales(SaleID, BookID, CustomerID, DateOfSale, QuantitySold, TotalPrice)
postgres-# VALUES (1, 1, 1, '2024-01-01', 2, 39.98),
postgres-#  (2, 2, 2, '2024-01-02', 1, 29.99),
postgres-# (3, 3, 1, '2024-01-03', 3, 59.97),
postgres-# (4, 4, 3, '2024-01-04', 1, 19.99),
postgres-# (5, 5, 2, '2024-01-05', 2, 59.98);
INSERT 0 5
postgres=# SELECT Books.Title, Customers.Name, Sales.DateOfSale
postgres-# FROM Sales
postgres-# JOIN Books ON Sales.BookID = Books.BookID
postgres-# JOIN Customers ON Sales.CustomerID = Customers.CustomerID;
         title         |     name      | dateofsale
-----------------------+---------------+------------
 The Great Gatsby      | Alice Johnson | 2024-01-01
 To Kill a Mockingbird | Bob Smith     | 2024-01-02
 1984                  | Alice Johnson | 2024-01-03
 The Hobbit            | Charlie Brown | 2024-01-04
 Moby-Dick             | Bob Smith     | 2024-01-05
(5 rows)


postgres=# SELECT Genre, SUM(Sales.TotalPrice) AS Price
postgres-# FROM Sales
postgres-# JOIN Books ON Sales.BookID = Books.BookID
postgres-# GROUP BY Genre;
   genre   | price
-----------+-------
 Fantasy   | 19.99
 Dystopian | 59.97
 Adventure | 59.98
 Fiction   | 69.97
(4 rows)


postgres=#