CREATE DATABASE IF NOT EXISTS Sales;
USE Sales;
CREATE TABLE  Sales(
Purchase_number int not null primary key auto_increment,
Date_of_Purchase date not null,
Customer_Id int,
Item_Code varchar(10) not null 
);
CREATE TABLE Customers(
Customer_Id int not null primary key auto_increment,
First_name varchar(255),
Last_name varchar(255),
Email_address varchar(255),
Number_of_Complaints int
);
describe sales;
select*from sales;
Select * from Customers;
select * from Sales . customers;
select * from Sales;
select * from Sales.Sales;
drop table Sales;
drop table Customers;
drop table sales;
CREATE TABLE Sales
(
   Purchase_number INT AUTO_INCREMENT,
   Date_of_Purchase DATE,
   Customer_Id INT,
   Item_code VARCHAR(10),
PRIMARY KEY(Purchase_number)
);
 select * from sales;
 describe sales;
 drop table customers;
 
 CREATE TABLE Customers
 (
    Customer_Id INT,
    First_name VARCHAR(255),
    last_name VARCHAR(255),
    Email_address VARCHAR(255),
    Number_of_Complaints INT,
PRIMARY KEY(Customer_Id)
);

CREATE TABLE items
(
   Item_code VARCHAR(255),
   Item VARCHAR(255),
   Unit_price NUMERIC(10,2),
   Company_id VARCHAR(255)
);

CREATE TABLE  Companies
(
   Company_Id VARCHAR(255),
   Company_name VARCHAR(255),
   Headquarters_phone_number INT(12)
);
   DROP TABLE Items;
CREATE TABLE items
(
   Item_code VARCHAR(255),
   Item VARCHAR(255),
   Unit_price NUMERIC(10,2),
   Company_id VARCHAR(255),
PRIMARY KEY(Item_code)
);

CREATE TABLE  Companies
(
   Company_Id VARCHAR(255),
   Company_name VARCHAR(255),
   Headquarters_phone_number INT(12),
PRIMARY KEY(Company_Id)
);
Drop table companies;
CREATE TABLE  Companies
(
   Company_Id VARCHAR(255),
   Company_name VARCHAR(255),
   Headquarters_phone_number INT,
PRIMARY KEY(Company_Id)
);

CREATE TABLE Sales
(
   Purchase_number INT AUTO_INCREMENT,
   Date_of_Purchase DATE,
   Customer_Id INT,
   Item_code VARCHAR(10),
PRIMARY KEY(Purchase_number)
);
DROP TABLE Sales;
DROP TABLE Customers;
DROP TABLE Items;
DROP TABLE Companies;

-- ADD UNIQUE KEY CONSTRAINT--
ALTER TABLE Customers
ADD UNIQUE KEY ( Email_address);

-- UNIQUE KEY CONSTRAINT--
ALTER TABLE Customers
DROP INDEX Email_address;

DROP TABLE Customers;

CREATE TABLE Customers
(
   Customer_Id INT AUTO_INCREMENT,
   First_name VARCHAR(255),
   Last_name VARCHAR(255),
   Email_address VARCHAR(255),
   Number_of_Complaints INT,
PRIMARY KEY(Customer_Id)
);

-- ADD COLUMN INTO EXISTING TABLE--
ALTER TABLE Customers
ADD COLUMN Gender ENUM('M','F') AFTER Last_name;

INSERT INTO Customers(First_name,Last_name,Gender,Email_address,Number_of_Complaints) VALUES
('John','Mackinley','M','john.mckinley@365careers.com',0);

-- ADD DEFAULT CONSTRAINT INTO EXISTING TABLE--

ALTER TABLE Customers
CHANGE COLUMN Number_of_Complaints Number_of_Complaints INT DEFAULT 0;

INSERT INTO Customers(First_name,Last_name,Gender) 
VALUES('Peter','Figaro','M');
select * from customers;


-- DROP DEFAULT CONSTRAINT--

ALTER TABLE Customers
ALTER COLUMN Number_of_Complaints DROP DEFAULT;

CREATE TABLE  Companies
(
   Company_Id VARCHAR(255),
   Company_name VARCHAR(255) DEFAULT 'X',
   Headquarters_phone_number INT,
PRIMARY KEY(Company_Id),
UNIQUE KEY(Headquarters_phone_number)
);
SELECT 
    *
FROM
    Companies;
drop table companies;


