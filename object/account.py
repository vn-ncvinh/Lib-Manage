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
    passwdmd5 = process.strtomd5(user+passwd)
    cursor.execute("select * from users where StudentID='" + user +"' and password = '"+passwdmd5+"' and status = 'active'")
    # print(passwdmd5)
    rows = cursor.fetchall()
    if(len(rows)>0):
        cursor.execute("select * from users_hide_password where StudentID='" + user +"'")
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE users_hide_password")
        cols = cursor.fetchall()
        process.log(user, "App", "Logged in successfully!")
        return process.tabletojson(cols, rows, "Logged in successfully!")
            
    else:
        return process.error("Student ID or Password incorrect or Account has been disabled!")
    

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
    if(row[6]==1):
        return True
    else:
        return False

def changetoken(token):
    newtoken = ''.join(random.choices(string.ascii_letters + string.digits, k=20))
    cursor.execute("select * from users where token='"+token+"'")
    rows = cursor.fetchall()
    if(len(rows)>0):
        query = "update users set token = '"+newtoken+"' where token = '"+token+"'"
        cursor.execute(query)
        db.connection.commit()
        process.log(tokentoStudentID(token), tokentoStudentID(token), "Change Token" )
        return process.ok("The token has been changed!")
    else:
        return process.error("An unknown error!")


def viewall(token):
    if(tokenadmin(token)):
        cursor.execute('select * from users_hide')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE users_hide")
        cols = cursor.fetchall()
        return process.tabletojson(cols, rows, "Successfully!")
    else:
        return process.error("You are not authorized to perform this action!")

def createuser(token, StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin):
    if (Admin != "0"):
        return process.error("You are not permitted!")
    if(tokenadmin(token)):
        cursor.execute('select * from users where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            return process.error("Student ID already exist!")
        Password = process.strtomd5(StudentID+Password)
        token = ''.join(random.choices(string.ascii_letters + string.digits, k=20))
        Expiry = '(select current_date() + interval 4 year)'
        query = "INSERT INTO users ( StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin, token, Expiry) VALUES ('"+StudentID+"', '"+Password+"', '"+Fullname+"', '"+PhoneNumber+"', '"+Specialization+"', '"+Class+"', '"+Admin+"', '"+token+"', "+Expiry+")"
        print(query)
        cursor.execute(query)
        db.connection.commit()
        cursor.execute('select * from users_hide where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE users_hide")
        cols = cursor.fetchall()
        process.log(tokentoStudentID(token), StudentID, "Create User")
        return process.tabletojson(cols, rows, "Successfully!")
    else:
        return process.error("You are not authorized to perform this action!")

def deluser(token, StudentID):
    if(tokenadmin(token)):
        cursor.execute('select * from users where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            if(StudentIDadmin(StudentID)):
                return process.error("You are not permitted!")
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
            process.log(tokentoStudentID(token), StudentID, "Delete User" )
            return process.ok("Deleted successfully!")
        else:
            return process.error("Student ID does not exist!")
    else:
        return process.error("You are not authorized to perform this action!")

def disableuser(token, StudentID):
    if(tokenadmin(token)):
        cursor.execute('select * from users where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            if(rows[0][9]=='active'):
                if(StudentIDadmin(StudentID)):
                    return process.error("You are not permitted!")
                query = "update users set status = 'disable' where StudentID = '"+StudentID+"'"
                cursor.execute(query)
                db.connection.commit()
                process.log(tokentoStudentID(token), StudentID, "Disable User" )
                return process.ok("Disabled!")
            else:
                return process.error("Student has been disabled before!")
        else:
            return process.error("Student ID does not exist!")
    else:
        return process.error("You are not authorized to perform this action!")

def activeuser(token, StudentID):
    if(tokenadmin(token)):
        cursor.execute('select * from users where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            if(rows[0][9]=='disable'):
                if(StudentIDadmin(StudentID)):
                    return process.error("You are not permitted!")
                query = "update users set status = 'active' where StudentID = '"+StudentID+"'"
                cursor.execute(query)
                db.connection.commit()
                process.log(tokentoStudentID(token), StudentID, "Disable User" )
                return process.ok("Actived!")
            else:
                return process.error("Student has been activated before!")
        else:
            return process.error("Student ID does not exist!")
    else:
        return process.error("You are not authorized to perform this action!")