from general_handle.dbc import cursor, connection
from general_handle import output, token_handle
import config

def request(token, documentsID, BorrowingTime):
    StudentID = token_handle.tokentoStudentID(token)
    
    if(int(BorrowingTime)<config.Min_Day_Borrow):
        return output.error("Borrowing time must be greater than "+str(config.Min_Day_Borrow)+" days")
    if(int(BorrowingTime)>config.Max_Day_Borrow):
        return output.error("Borrowing time is only allowed for a limit of "+str(config.Max_Day_Borrow)+" days")
    cursor.execute('select * from borrow where StudentID = "'+StudentID+'" and (status = "borrowed" or status = "wait")')
    rows = cursor.fetchall()
    if(len(rows)>config.Limited_Borrows):
        return output.error("The maximum number can be borrowed is "+str(config.Limited_Borrows))
    cursor.execute('select * from documents_quantity where ID = "'+documentsID+'"')
    rows = cursor.fetchall()
    if(len(rows)>0):
        NameDocuments = rows[0][1]
        if(int(rows[0][5])>0):
            cursor.execute('select * from document where documentsID = "'+documentsID+'" and status="available"')
            row = cursor.fetchone()
            documentID = row[0]
            StudentID = token_handle.tokentoStudentID(token)
            cursor.execute('update document set status = "not available" where id = "'+documentID+'"')
            connection.commit()
            cursor.execute('INSERT INTO borrow (StudentID, DocumentID, NameDocument, BorrowingTime) VALUES ("'+StudentID+'", "'+documentID+'", "'+NameDocuments+'", '+BorrowingTime+');')
            connection.commit()
            cursor.execute('select * from borrow where StudentID = "'+StudentID+'" and DocumentID = "'+documentID+'" and status = "wait"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            output.log(token_handle.tokentoStudentID(token), str(rows[0][0]), "Borrow Document")
            return output.tabletojson(cols, rows,"Borrow registration successful!")
        else:
            return output.error("Not enough number!")
    return output.error(config.unknown)

def cancel(token, borrowID):
    StudentID = token_handle.tokentoStudentID(token)
    cursor.execute('select * from borrow where ID = "'+borrowID+'" and StudentID = "'+StudentID+'" and status = "wait"')
    rows = cursor.fetchall()

    if(len(rows)>0):
        documentID = rows[0][2]
        cursor.execute('update document set status = "available" where id = "'+documentID+'"')
        connection.commit()
        cursor.execute('update borrow set status = "cancel" where id = "'+borrowID+'"')
        connection.commit()
        cursor.execute('select * from borrow where ID = "'+borrowID+'"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        output.log(token_handle.tokentoStudentID(token), str(borrowID), "Cancel Borrow")
        return output.tabletojson(cols, rows, "Canceled!")
    else:
        return output.error(config.unknown)

def all(token):
    StudentID = token_handle.tokentoStudentID(token)
    cursor.execute('select * from borrow where StudentID = "'+StudentID+'"')
    rows = cursor.fetchall()
    cursor.execute("DESCRIBE borrow")
    cols = cursor.fetchall()
    return output.tabletojson(cols, rows, config.Success)
