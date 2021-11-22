from config import db
import hashlib
import json
from process import tabletojson

cursor = db.connection.cursor()

def checktoken(token):
    query="select * from users where token='"+token+"'"
    cursor.execute(query)
    rows = cursor.fetchall()
    if(len(rows)>0):
        return True
    else:
        return False

def login(user, passwd):
    cursor.execute("select * from users where StudentID='" + user +"'")
    passwdmd5 = hashlib.md5((user+passwd).encode('utf-8')).hexdigest().upper()
    print(passwdmd5)
    rows = cursor.fetchall()
    if rows[0][1] == passwdmd5:
        cursor.execute("DESCRIBE users")
        cols = cursor.fetchall()
        return tabletojson.tojson(cols, rows)
    else:
        return json.loads('{"status":201}')