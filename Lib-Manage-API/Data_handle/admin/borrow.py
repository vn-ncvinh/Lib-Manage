from general_handle.dbc import cursor, connection
from general_handle import output, token_handle
import config


def viewall(token):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where status = "wait" or status = "borrowed"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        return output.tabletojson(cols, rows, config.Success)
    else:
        return output.error(config.not_permitted)

def SearchbyStudentID(token, StudentID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select * from borrow where StudentID = "'+StudentID+'"')
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE borrow")
        cols = cursor.fetchall()
        return output.tabletojson(cols, rows, config.Success)
    else:
        return output.error(config.not_permitted)

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
            return output.tabletojson(cols, rows, config.Success)
        else:
            return output.error(config.unknown)
    else:
        return output.error(config.not_permitted)

def returndocument(token, documentID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select ID, (DATEDIFF(current_date(), BorrowDate) - BorrowingTime) as "date", StudentID from borrow where documentID = "'+documentID+'" and status = "borrowed"')
        rows = cursor.fetchall()
        if(len(rows)>0):
            borrowID = rows[0][0]
            datelate = rows[0][1]
            print(datelate)
            StudentID = rows[0][2]
            cursor.execute('update document set status = "available" where id = "'+documentID+'"')
            connection.commit()
            
            if(int(datelate)>0):
                Pay_the_fine=datelate*config.Late_payment_penalty_per_day
                cursor.execute('update borrow set status = "return", ReturnDate = current_date(), note = "Pay the fine '+str(Pay_the_fine)+'" where id = '+ str(borrowID))
                connection.commit()
                output.log(token_handle.tokentoStudentID(token), documentID,StudentID + " Return Document and Pay the fine " + str(Pay_the_fine))
                return output.ok("Late payment penalty amount to be paid:  "+str(config.Late_payment_penalty_per_day) +" * " + str(datelate) +" = " + str(Pay_the_fine))
            cursor.execute('update borrow set status = "return", ReturnDate = current_date() where id = '+ str(borrowID))
            connection.commit()
            output.log(token_handle.tokentoStudentID(token), documentID,StudentID + " Return Document")
            return output.ok(config.Success)
        else:
            return output.error(config.unknown)
    else:
        return output.error(config.not_permitted)

def lose(token, documentID):
    if(token_handle.tokenadmin(token)):
        cursor.execute('select borrow.ID, borrow.StudentID, document.Price from borrow, document where documentID = "'+documentID+'" and borrow.status = "borrowed" and borrow.DocumentID=document.ID group by borrow.ID;')
        rows = cursor.fetchall()
        if(len(rows)>0):
            borrowID = rows[0][0]
            StudentID = rows[0][1]
            Price = rows[0][2]
            Pay_the_fine = Price*1.5
            cursor.execute('DELETE FROM document where id = "'+documentID+'"')
            connection.commit()
            cursor.execute('update borrow set status = "lose", ReturnDate = current_date(), note = "Pay the fine '+str(Pay_the_fine)+'" where id = '+ str(borrowID))
            connection.commit()
            output.log(token_handle.tokentoStudentID(token), str(borrowID), StudentID + " Lose Document and Pay the fine "+str(Pay_the_fine))
            return output.ok("The penalty for loss is " + str(Pay_the_fine))
        else:
            return output.error(config.unknown) 
    else:
        return output.error(config.not_permitted)