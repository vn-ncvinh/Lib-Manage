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

def addbooks(token, Name, Author, Description):
    if(account.tokenadmin(token)):
        query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
        cursor.execute(query)
        rows=cursor.fetchall()
        if(len(rows)>0):
            return process.error("Books already exist!")
        try:
            query="INSERT INTO documents (Name, Author, Description) VALUES ('"+Name+"', '"+Author+"', '"+Description+"')"
            cursor.execute(query)
            db.connection.commit()
            query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
            cursor.execute(query)
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE documents")
            cols = cursor.fetchall()
            return process.tabletojson(cols, rows, "Successfully!")
        except Exception as e:
            return process.error(str(e))

