from server import db
from server import process
import random
import string

cursor = db.cursor

def checktoken(token):
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

def login(user, passwd):
    cursor.execute("select * from users where StudentID='" + user +"'")
    passwdmd5 = process.strtomd5(user+passwd)
    print(passwdmd5)
    rows = cursor.fetchall()
    if(len(rows)>0):
        if rows[0][1] == passwdmd5:
            cursor.execute("select * from users_without_password where StudentID='" + user +"'")
            cursor.execute("DESCRIBE users")
            cols = cursor.fetchall()
            return process.tabletojson(cols, rows)
    else:
        return process.error("Student ID or Password incorrect!")
    

def tokenadmin(token):
    cursor.execute("select * from users where token='"+token+"'")
    row = cursor.fetchone()
    if(row[6]==1):
        return True
    else:
        return False

def viewall(token):
    if(tokenadmin(token)):
        cursor.execute('select * from users_hide')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE users_hide")
        cols = cursor.fetchall()
        return process.tabletojson(cols, rows)
    else:
        return process.error("You are not authorized to perform this action!")

def createuser(token, StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin):
    if(tokenadmin(token)):
        Password = process.strtomd5(StudentID+Password)
        token = ''.join(random.choices(string.ascii_letters + string.digits, k=20))
        Expiry = '(select current_date() + interval 4 year)'
        query = "INSERT INTO users VALUES ('"+StudentID+"', '"+Password+"', '"+Fullname+"', '"+PhoneNumber+"', '"+Specialization+"', '"+Class+"', '"+Admin+"', '"+token+"', "+Expiry+")"
        cursor.execute(query)
        db.connection.commit()
        cursor.execute('select * from users_hide where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE users_hide")
        cols = cursor.fetchall()
        process.log("Create User", StudentID)
        return process.tabletojson(cols, rows)
    else:
        return process.error("You are not authorized to perform this action!")

def deluser(token, StudentID):
    if(tokenadmin(token)):
        query = "Select * from borrow where StudentID = '"+StudentID+"' and (status = 'borrowed' or status = 'wait')"
        cursor.execute(query)
        rows = cursor.fetchall()
        if(len(rows)>0):
            return process.strtojson('{"status": "ERROR", "data":[{"message": "Sinh viên còn tài liệu đang đợi mượn hoặc chưa trả!"}]}')
        query = "delete FROM borrow where StudentID = '"+StudentID+"'"
        cursor.execute(query)
        db.connection.commit()
        query = "delete FROM users where StudentID = '"+StudentID+"'"
        cursor.execute(query)
        db.connection.commit()
        process.log("Delete User", StudentID)
        return process.ok("Deleted successfully!")
    else:
        return process.error("You are not authorized to perform this action!")