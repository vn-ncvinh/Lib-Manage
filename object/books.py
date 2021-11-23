from config import db
from object import account
import json
from process import tabletojson

cursor = db.connection.cursor()

def allbooks(token):
    if(account.checktoken(token)):
        query="select * from documents_quantity"
        cursor.execute(query)
        rows=cursor.fetchall()
        cursor.execute("DESCRIBE documents_quantity")
        cols=cursor.fetchall()
        return tabletojson.tojson(cols,rows)
    else:
        return json.loads('{"status":201}')

def searchbookswithname(name, token):
    if(account.checktoken(token)):
        query="select * from documents_quantity where Name like '%"+name+"%'"
        cursor.execute(query)
        print(query)
        rows=cursor.fetchall()
        cursor.execute("DESCRIBE documents_quantity")
        cols=cursor.fetchall()
        return tabletojson.tojson(cols,rows)
    else:
        return json.loads('{"status":201}')

def searchbookswithauthor(author, token):
    if(account.checktoken(token)):
        query="select * from documents_quantity where author like '%"+author+"%'"
        cursor.execute(query)
        print(query)
        rows=cursor.fetchall()
        cursor.execute("DESCRIBE documents_quantity")
        cols=cursor.fetchall()
        return tabletojson.tojson(cols,rows)
    else:
        return json.loads('{"status":201}')

def getcategory(token):
    if(account.checktoken(token)):
        query="select * from category_quantity"
        cursor.execute(query)
        rows=cursor.fetchall()
        cursor.execute("DESCRIBE category_quantity")
        cols=cursor.fetchall()
        return tabletojson.tojson(cols,rows)
    else:
        return json.loads('{"status":201}')

