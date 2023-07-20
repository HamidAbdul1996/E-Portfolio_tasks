CREATE TABLE Orders (
Order_ID INT NOT NULL,
Customer_ID INT NOT NULL,
Product_ID INT NOT NULL,
Order_date DATE,
PRIMARY KEY (Order_ID)
);

CREATE TABLE Customer (
Customer_ID INT NOT NULL,
First_Name VARCHAR(100) NOT NULL,
Last_Name VARCHAR(100) NOT NULL,
AGE INTEGER,
Email VARCHAR(100),
PRIMARY KEY (Customer_ID)
);

CREATE TABLE Product (
Product_ID INT NOT NULL,
Product_name VARCHAR(100) NOT NULL,
Pharmacy_ID INT NOT NULL,
Product_Type VARCHAR(100) NOT NULL,
Stock_Level INTEGER,
PRIMARY KEY (Product_ID)
);

CREATE TABLE Product_Type (
Product_Type VARCHAR(100) NOT NULL,
Product_Description VARCHAR(100) NOT NULL,
PRIMARY KEY (Product_Type)
);


CREATE TABLE SALES (
Sales_ID INT NOT NULL,
Product_ID INT NOT NULL,
Sale_date DATE,
Quanity INT, 
Price DECIMAL NOT NULL,
PRIMARY KEY (Sales_ID)
);

CREATE TABLE Pharmacy (
Pharmacy_ID INT NOT NULL,
Pharmacy_name VARCHAR(100) NOT NULL,
Pharmacy_address VARCHAR(100) NOT NULL,
Pharmacy_number VARCHAR(100) NOT NULL,
PRIMARY KEY (Pharmacy_ID)
);

ALTER TABLE ORDERS
ADD FOREIGN KEY (Customer_ID) REFERENCES customer(Customer_ID),
ADD FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);

ALTER TABLE product
ADD FOREIGN KEY (Pharmacy_ID) REFERENCES Pharmacy(Pharmacy_ID),
ADD FOREIGN KEY (Product_Type) REFERENCES Product_Type(Product_Type);

ALTER TABLE SALES
ADD FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID);


INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Age, Email)
VALUES(00001, "John", "Doe", 34, "johndoe@gmail.com"),
	  (00002, "Jane", "Smith", 56, "Janesmith@gmail.com"),
      (00003, "Sam", "Jones", 67, "N/A");
      
INSERT INTO Pharmacy (Pharmacy_ID, Pharmacy_name, Pharmacy_address, Pharmacy_number)
VALUES(1, "Epsom Lloyds Pharmacy", "12 London Road", "07625 430827"),
	  (2, "Croydon Lloyds Pharmacy", "11 Croydon Road", "0208 567723"),
      (3, "Streatham Lloyds Pharmacy", "4 Streatham High Street", "07922 972 837");
      
      
INSERT INTO Product_Type (Product_Type, Product_description)
VALUES("Tablet", "Active ingredient is combined with another substance and pressed onto a round shape"),
	  ("Liquid", "Active part of medicine is combined with a liquid to make it easier to take or better absorbed"),
      ("Capsule", "Medicine is contained in a plastic shell that dissolves in stomach");
      
INSERT INTO Product(Product_ID, Product_Name, Pharmacy_ID, Product_Type, Stock_Level)
VALUES(001, "Advil", 1, "Tablet", 100),
	  (002, "Codiene", 2, "Liquid", 35),
      (003, "Memantine", 3, "Capsule", 500);

INSERT INTO Orders (Order_ID, Customer_ID, Product_ID, Order_date)
VALUES(01, 00001, 001, "2023-06-05"),
	  (02, 00002, 002, "2023-04-02"),
      (03, 00003, 003, "2023-01-01");
      
INSERT INTO Sales (Sales_ID, Product_ID, Sale_date, Quanity, Price)
VALUES(11, 001, "2023-06-02", 1, 4.99),
	  (12, 002, "2023-03-27", 3, 8.99),
      (13, 003, "2022-12-22", 10, 24.99);

ALTER TABLE Sales
Modify Price Decimal (5,2)

UPDATE Sales
SET Price = 4.50
WHERE Sales_ID = 11;

UPDATE Sales
SET Price = 8.76
WHERE Sales_ID = 12;

UPDATE Sales
SET Price = 24.99
WHERE Sales_ID = 13;

select orders.order_id, orders.order_date, product.product_name
FROM orders
INNER JOIN product
ON orders.product_ID = product.Product_ID;

SELECT * FROM PRODUCT;


