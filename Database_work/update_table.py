import pyodbc

conn = pyodbc.connect(
    "DRIVER={ODBC Driver 18 for SQL Server};"
    "SERVER=fall2026classes.database.windows.net,1433;"
    "DATABASE=cis255Fall2026;"
    "UID=carolynbrodie;"
    "PWD=forCkass2026!;"
    "Encrypt=yes;"
    "TrustServerCertificate=no;"
    "Connection Timeout=30;"
)
cursor = conn.cursor()

## Insert Data
insertEmployee = "INSERT INTO Accounts.Customer(Customer_Fname, Customer_Lname, Address, Ssn) VALUES('Jerry', 'Attrick', '333 Third', '333-33-3333');"
cursor.execute(insertEmployee)
conn.commit()


## Uncomment and run to see if inserted data is there
# sqlcommand = "SELECT Customer_ID, Customer_Fname, Customer_Lname FROM Accounts.Customer"
# cursor.execute(sqlcommand)
#
# for row in cursor:
#     print('Customer_ID =', row.Customer_ID, 'Customer_Fname =', row.Customer_Fname, 'Customer_Lname = ', row.Customer_Lname)


conn.close()
