from server import db
from server import process
from object import account

cursor = db.cursor

def allbooks():
    query="select * from documents_quantity"
    cursor.execute(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows, "Successfully!")

def searchbooks(name):
    query="select * from documents_quantity where Name like '%"+name+"%'"
    cursor.execute(query)
    print(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows, "Successfully!")

def getcategory():
    query="select * from category_quantity"
    cursor.execute(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE category_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows, "Successfully!")
