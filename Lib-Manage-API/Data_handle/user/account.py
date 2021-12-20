from general_handle.dbc import cursor, connection
from general_handle import output, string_handle, token_handle
import config

def login(user, passwd):
    user = user.upper()
    passwdmd5 = string_handle.toMD5(user+passwd)
    cursor.execute("select * from users where StudentID='" + user +"' and password = '"+passwdmd5+"' and status = 'active'")
    # print(passwdmd5)
    rows = cursor.fetchall()
    if(len(rows)>0):
        token = token_handle.newtoken()
        query = "update users set token = '"+token+"' where StudentID = '"+user+"'"
        cursor.execute(query)
        connection.commit()
        cursor.execute("select * from users_hide_password where StudentID='" + user +"'")
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE users_hide_password")
        cols = cursor.fetchall()
        output.log(user, "App", "Logged in successfully!")
        return output.tabletojson(cols, rows, "Logged in successfully!")
            
    else:
        return output.error("Student ID or Password incorrect or Account has been disabled!")

def logout(token):
    StudentID = token_handle.tokentoStudentID(token)
    query = "update users set token = 'TOKEN' where token = '"+token+"'"
    cursor.execute(query)
    connection.commit()
    output.log(StudentID, "App", "Logout!")
    return output.ok(config.Success)

def changepass(token, oldpassword, newpassword):
    oldpassword = string_handle.toMD5(token_handle.tokentoStudentID(token)+oldpassword)
    newpassword = string_handle.toMD5(token_handle.tokentoStudentID(token)+newpassword)
    
    cursor.execute("select * from users where StudentID='" + token_handle.tokentoStudentID(token) +"' and password = '"+oldpassword+"'")
    rows = cursor.fetchall()
    if len(rows)>0:
        query = "update users set password = '"+newpassword+"' where StudentID = '"+token_handle.tokentoStudentID(token)+"' and password = '"+oldpassword+"'"
        cursor.execute(query)
        connection.commit()
        StudentID =token_handle.tokentoStudentID(token);
        output.log(StudentID, StudentID, "Change password!")
        return output.ok(config.Success)
    else:
        return output.error("Old Password Incorrect!")
