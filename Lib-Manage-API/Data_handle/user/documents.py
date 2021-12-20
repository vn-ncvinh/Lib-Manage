from general_handle.dbc import cursor
from general_handle import output
import config

def all():
    query="select * from documents_quantity"
    cursor.execute(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return output.tabletojson(cols,rows, config.Success)

def search(name):
    query="select * from documents_quantity where Name like '%"+name+"%'"
    cursor.execute(query)
    print(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE documents_quantity")
    cols=cursor.fetchall()
    return output.tabletojson(cols,rows, config.Success)

def category():
    query="select * from category"
    cursor.execute(query)
    rows=cursor.fetchall()
    cursor.execute("DESCRIBE category")
    cols=cursor.fetchall()
    return output.tabletojson(cols,rows, config.Success)
