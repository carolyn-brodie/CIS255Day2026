IF SCHEMA_ID('Test') IS NULL
BEGIN
    EXEC ('CREATE SCHEMA Test AUTHORIZATION dbo')
END 
GO

 

IF OBJECT_ID('Test.tableB', 'U') IS NOT NULL
      DROP TABLE Test.tableB;
IF OBJECT_ID('Test.tableA', 'U') IS NOT NULL
      DROP TABLE Test.tableA;


CREATE TABLE Test.tableA
(
	 Customer_ID			INT				NOT NULL Identity(1,1),
	 Customer_Fname			VARCHAR(15)		NOT NULL,
	 Customer_Lname			VARCHAR(20) 	NOT NULL,
	 Address				VARCHAR(50) 	NOT NULL,
	 Ssn					VARCHAR(11) 	NOT NULL,
	 PRIMARY KEY(Customer_ID)
);

CREATE TABLE Test.tableB
(
	 AcctID			INT				NOT NULL Identity(1,1),
	 Customer_ID	INT				NOT NULL,
	 Account_name   VARCHAR(10)	    NOT NULL,
	 Balance	MONEY			NOT NULL,
	 PRIMARY KEY(AcctID),
	 FOREIGN KEY(Customer_ID) REFERENCES Test.tableA(Customer_ID),
);


GO
INSERT INTO Test.tableA(Customer_Fname, Customer_Lname, Address, Ssn)
	VALUES
		('Suzy', 'Que', '111 First Street', '111-11-1111'),
		('Tom', 'Thumb', '222 Second Street', '222-22-2222'),
		('Rose', 'Bush', '333 Third Street', '333-33-3333');

INSERT INTO Test.tableB(Customer_ID, Account_name, Balance)
	VALUES
		(2, 'Name 1', 105.55),
		(1, 'Name 2', 5436.00),
		(3, 'Name 3', 467.10);
	        
