+*In[ ]:*+
[source, ipython3]
----
import requests

URL = "https://dep.gateway.ky.gov/DataAccessToolAPI/EEC/API/WatershedSite"

response = requests.get(URL)
with open('TBL_Sites.json', 'wb') as file:
    file.write(response.content)
    
import json
TABLE_NAME = "TBL_SITE"
sqlstatement = ''
with open ('TBL_Sites.json','r') as f:
    jsondata = json.loads(f.read())

import pyodbc
conn = pyodbc.connect('Driver={SQL Server};Server=128.163.188.87;Database=WaterWatch;Trusted_Connection=yes')
conn.timeout = 60    
conn.autocommit = True   
cursor = conn.cursor()
cursor.execute("truncate table TBL_SITE")

for json in jsondata:
    keylist = "("
    valuelist = "("
    firstPair = True
    for key, value in json.items():
        
        if not firstPair:
            keylist += ", "
            valuelist += ", "
        firstPair = False
        keylist += key
        if type(value) in (str, u''.__class__):
            value=value.replace("'", "''")
            valuelist += "'" + value + "'"
        elif value is None:
            valuelist += "''"
        else:
            valuelist += str(value)
    keylist += ")"
    valuelist += ")"
    sqlstatement = "INSERT INTO " + TABLE_NAME + " " + keylist + " VALUES " + valuelist + "\n"
    #print(sqlstatement)
    cursor.execute(sqlstatement)
    
    
----


+*In[ ]:*+
[source, ipython3]
----

----


+*In[ ]:*+
[source, ipython3]
----

----


+*In[ ]:*+
[source, ipython3]
----

----
