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


city = input("Enter the city: ")
## two possible ship cities, Seattle and Madrid
sqlcommand = "SELECT orderid, orderdate, shipcity FROM TSQLSales.Orders WHERE shipcity = ?"
cursor.execute(sqlcommand,[city])
row = cursor.fetchone()

## For single row
# if row is not None:
#     print(row[0],row[1])
    #print('From fetch orderid =', row.orderid, 'orderdate =', row.orderdate, 'shipcity = ', row.shipcity)

for row in cursor:
    print('orderid =', row.orderid, 'orderdate =', row.orderdate, 'shipcity = ', row.shipcity)

conn.close()
