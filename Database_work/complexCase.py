import pyodbc
## Sample customer NRZBB
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

custidColumn = "custid"
orderidColumn = "orderid"
validCustomer = False

customerQuery = f"SELECT {custidColumn} FROM TSQLSales.Customers WHERE CompanyName =?;"
orderQuery = f"SELECT {orderidColumn}  FROM TSQLSales.Orders WHERE {custidColumn} = ?;"
#MLTDN

userCompanyName = input("Input the customer's company name " +
                        "(just include the letter part; don't include the word \"Customer\"):")
companyName = "Customer " + userCompanyName
try:
    result = cursor.execute(customerQuery, [companyName])
    row = result.fetchone()
    custid = row[0]
    cursor.execute(orderQuery, [custid])
    validCustomer = True
except pyodbc.ProgrammingError as Exception:
    print("Invalid Customer Name")

if validCustomer:
    print(f"\n {companyName}'s {orderidColumn}s: ")
    for row in cursor:
        print(row.orderid)

conn.close()



