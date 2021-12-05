from server import db
from object import account
from server import process

cursor = db.cursor

def borrowbook(token, documentsID, BorrowingTime):
    cursor.execute('select * from documents_quantity where ID = "'+documentsID+'"')
    row = cursor.fetchone()
    # print(row)
    if(row[4]>0):
        cursor.execute('select * from document where documentsID = "'+documentsID+'" and status="available"')
        row = cursor.fetchone()
        documentID = row[0]
        StudentID = account.tokentoStudentID(token)
        cursor.execute('update document set status = "not available" where id = "'+documentID+'"')
        db.connection.commit()
        cursor.execute('INSERT INTO borrow (StudentID, DocumentID, BorrowingTime) VALUES ("'+StudentID+'", "'+documentID+'", '+BorrowingTime+');')
        db.connection.commit()
        cursor.execute('select * from borrow where StudentID = "'+StudentID+'" and DocumentID = "'+documentID+'" and status = "wait"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        process.log(account.tokentoStudentID(token), str(rows[0][0]), "Borrow Document")
        return process.tabletojson(cols, rows,"Borrow registration successful!")

    else:
        return process.error("An unknown error!")

def cancel(token, borrowID):
    StudentID = account.tokentoStudentID(token)
    cursor.execute('select * from borrow where ID = "'+borrowID+'" and StudentID = "'+StudentID+'" and status = "wait"')
    rows = cursor.fetchall()

    if(len(rows)>0):
        documentID = rows[0][2]
        cursor.execute('update document set status = "available" where id = "'+documentID+'"')
        db.connection.commit()
        cursor.execute('update borrow set status = "cancel" where id = "'+borrowID+'"')
        db.connection.commit()
        cursor.execute('select * from borrow where ID = "'+borrowID+'"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        process.log(account.tokentoStudentID(token), str(borrowID), "Cancel Borrow")
        return process.tabletojson(cols, rows, "Canceled!")
    else:
        return process.error("An unknown error!")

def viewall(token):
    StudentID = account.tokentoStudentID(token)
    cursor.execute('select * from borrow where StudentID = "'+StudentID+'"')
    rows = cursor.fetchall()
    cursor.execute("DESCRIBE borrow")
    cols = cursor.fetchall()
    return process.tabletojson(cols, rows, "Successfully!")

def allofStudent(token, StudentID):
    if(account.tokenadmin(token)):
        cursor.execute('select * from users where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            cursor.execute('select * from borrow where StudentID = "'+StudentID+'"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            return process.tabletojson(cols, rows, "Successfully!")
        else:
            return process.error("Student ID does not exist!")
    else:
        return process.error("You are not authorized to perform this action!")

def confirm(token, borrowID):
    if(account.tokenadmin(token)):
        cursor.execute('select * from borrow where ID = "'+borrowID+'" and status = "wait"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            cursor.execute('update borrow set status = "borrowed", BorrowDate = current_date() where id = "'+borrowID+'"')
            db.connection.commit()
            cursor.execute('select * from borrow where ID = "'+borrowID+'"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            process.log(account.tokentoStudentID(token), str(borrowID), "Confirm Borrow")
            return process.tabletojson(cols, rows, "Successfully!")
        
    else:
        return process.error("You are not authorized to perform this action!")

def returndocument(token, documentID):
    if(account.tokenadmin(token)):
        cursor.execute('select * from borrow where documentID = "'+documentID+'" and status = "borrowed"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            borrowID = rows[0][0]
            cursor.execute('update document set status = "available" where id = "'+documentID+'"')
            db.connection.commit()
            cursor.execute('update borrow set status = "return", ReturnDate = current_date() where id = '+ str(borrowID))
            db.connection.commit()
            cursor.execute('select * from borrow where ID = "'+str(borrowID)+'"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            process.log(account.tokentoStudentID(token), str(borrowID), "Return Document")
            return process.tabletojson(cols, rows, "Successfully!")
        else:
            return process.error("An unknown error!")
    else:
        return process.error("You are not authorized to perform this action!")



