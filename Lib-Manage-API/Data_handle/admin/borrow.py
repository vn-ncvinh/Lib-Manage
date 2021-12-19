from general_handle.dbc import cursor, connection
from general_handle import output, token_handle


def viewall(token):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where status = "wait" or status = "borrowed"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        return output.tabletojson(cols, rows, "Successfully!")
    else:
        return output.error("You are not authorized to perform this action!")

def SearchbyStudentID(token, StudentID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        return output.tabletojson(cols, rows, "Successfully!")
    else:
        return output.error("You are not authorized to perform this action!")

def confirm(token, borrowID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where ID = "'+borrowID+'" and status = "wait"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            cursor.execute('update borrow set status = "borrowed", BorrowDate = current_date() where id = "'+borrowID+'"')
            connection.commit()
            cursor.execute('select * from borrow where ID = "'+borrowID+'"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            output.log(token_handle.tokentoStudentID(token), str(borrowID), "Confirm Borrow")
            return output.tabletojson(cols, rows, "Successfully!")
        else:
            return output.error("An unknown error!")
    else:
        return output.error("You are not authorized to perform this action!")

def returndocument(token, documentID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where documentID = "'+documentID+'" and status = "borrowed"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            borrowID = rows[0][0]
            cursor.execute('update document set status = "available" where id = "'+documentID+'"')
            connection.commit()
            cursor.execute('update borrow set status = "return", ReturnDate = current_date() where id = '+ str(borrowID))
            connection.commit()
            cursor.execute('select * from borrow where ID = "'+str(borrowID)+'"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            output.log(token_handle.tokentoStudentID(token), str(borrowID), "Return Document")
            return output.tabletojson(cols, rows, "Successfully!")
        else:
            return output.error("An unknown error!")
    else:
        return output.error("You are not authorized to perform this action!")

def lose(token, documentID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where documentID = "'+documentID+'" and status = "borrowed"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            borrowID = rows[0][0]
            StudentID = rows[0][1]
            cursor.execute('DELETE FROM document where id = "'+documentID+'"')
            connection.commit()
            cursor.execute('update borrow set status = "lose", ReturnDate = current_date() where id = '+ str(borrowID))
            connection.commit()
            cursor.execute('select * from borrow where ID = "'+str(borrowID)+'"')
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE borrow")
            cols = cursor.fetchall()
            output.log(token_handle.tokentoStudentID(token), str(borrowID), StudentID + " - Lose Document")
            return output.tabletojson(cols, rows, "Successfully!")
        else:
            return output.error("An unknown error!")
    else:
        return output.error("You are not authorized to perform this action!")