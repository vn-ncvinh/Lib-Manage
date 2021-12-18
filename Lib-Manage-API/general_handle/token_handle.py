from general_handle.dbc import cursor
import random
import string

def newtoken():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=30))

def checktoken(token):
    if(token.upper() == 'TOKEN'):
        return False
    query="select * from users where token='"+token+"' and status = 'active'"
    cursor.execute(query)
    rows = cursor.fetchall()
    if(len(rows)>0):
        return True
    else:
        return False

def tokentoStudentID(token):
    cursor.execute("select * from users where token='"+token+"'")
    row = cursor.fetchone()
    return row[0]

def tokenadmin(token):
    cursor.execute("select * from users where token='"+token+"'")
    row = cursor.fetchone()
    if(row[6]==1):
        return True
    else:
        return False

def StudentIDadmin(StudentID):
    cursor.execute("select * from users where StudentID='"+StudentID+"'")
    row = cursor.fetchone()
    # print(StudentID)
    if(row[6]==1):
        return True
    else:
        return False