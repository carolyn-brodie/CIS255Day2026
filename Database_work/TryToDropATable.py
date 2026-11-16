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

input_string = input("Enter the account name: ")


querystring = "SELECT * FROM Test.tableB where Account_name=" + input_string
print(querystring)
cursor.execute(querystring)

# querystring = "SELECT * FROM Test.tableB where Account_name= ?"
#
# cursor.execute(querystring, [input_string])

# for row in cursor:
#     print('Customer_ID', row.Customer_ID, 'Account_name', row.Account_name, 'Balance', row.Balance)
conn.commit()
conn.close()
