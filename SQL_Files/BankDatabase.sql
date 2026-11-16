

IF SCHEMA_ID('Accounts') IS NULL
BEGIN
    EXEC ('CREATE SCHEMA Accounts AUTHORIZATION dbo')
END 
GO

IF OBJECT_ID('Accounts.BankAccount', 'U') IS NOT NULL
      DROP TABLE Accounts.BankAccount;
IF OBJECT_ID('Accounts.Customer', 'U') IS NOT NULL
      DROP TABLE Accounts.Customer;


CREATE TABLE Accounts.Customer
(
	 Customer_ID			INT		Identity(1,10)		NOT NULL,
	 Customer_Fname			VARCHAR(15)				NOT NULL,
	 Customer_Lname			VARCHAR(20) 			NOT NULL,
	 Address				VARCHAR(50) 			NOT NULL,
	 Ssn					VARCHAR(11) 			NOT NULL,
	 PRIMARY KEY(Customer_ID)
);

CREATE TABLE Accounts.BankAccount
(
	 AcctID			INT		Identity(100,10)		NOT NULL,
	 Customer_ID	INT						NOT NULL,
	 Balance		MONEY 					NOT NULL,
	 PRIMARY KEY(AcctID),
	 FOREIGN KEY(Customer_ID) REFERENCES Accounts.Customer(Customer_ID)
);

GO

INSERT INTO Accounts.Customer(Customer_Fname, Customer_Lname, Address, Ssn)
	VALUES
		('Sammy', 'Jones', '111 First Street', '111-11-1111'),
	     ('Joey', 'Smith', '222 Second Street', '222-22-2222');


INSERT INTO Accounts.BankAccount(Customer_ID, Balance)
	VALUES
		(1, 100.20),
	     (11, 6786.98);

