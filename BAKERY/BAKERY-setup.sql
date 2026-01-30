CREATE TABLE CUSTOMERS (
Id INT  auto_increment PRIMARY KEY,
LastName Varchar(50),
FirstName Varchar (50)
);

CREATE TABLE GOODS (
Id Varchar(100) UNIQUE,
Flavor Varchar(100),
Food Varchar (50),
Price DECIMAL (5,2),
PRIMARY KEY (Flavor, Food)
);


CREATE TABLE RECEIPTS (
ReceiptNumber INT NOT NULL PRIMARY KEY,
Date DATE NOT NULL,
CustomerId INT,
CONSTRAINT fk_customer
	FOREIGN KEY (CustomerId) REFERENCES CUSTOMERS (Id)
);

CREATE TABLE ITEMS (
Receipt INT,
Ordinal TINYINT,
Item Varchar (100),
PRIMARY KEY (Receipt, Ordinal),
CONSTRAINT fk_receipt
	FOREIGN KEY (Receipt) REFERENCES RECEIPTS(ReceiptNumber),
CONSTRAINT fk_goods
	FOREIGN KEY (Item) REFERENCES GOODS (Id)
);

