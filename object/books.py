from server import db
from server import process

cursor = db.cursor

def allbooks(token):
    query="select * from documents_quantity"
    cursor.execute(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows)

def searchbookswithname(name, token):
    query="select * from documents_quantity where Name like '%"+name+"%'"
    cursor.execute(query)
    print(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows)

def searchbookswithauthor(author, token):
    query="select * from documents_quantity where author like '%"+author+"%'"
    cursor.execute(query)
    print(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows)

def getcategory(token):
    query="select * from category_quantity"
    cursor.execute(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE category_quantity")
    cols=cursor.fetchall()
    return process.tabletojson(cols,rows)
