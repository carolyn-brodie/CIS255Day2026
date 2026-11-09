import pyodbc

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
cursor.execute("SELECT @@VERSION")
print(cursor.fetchone()[0])