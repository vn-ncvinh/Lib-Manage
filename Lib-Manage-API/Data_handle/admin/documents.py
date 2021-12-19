from general_handle.dbc import cursor, connection
from general_handle import output, token_handle

def add(token, Name, Author, Description, ListCategoryID):
    if(token_handle.tokenadmin(token)):
        query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
        cursor.execute(query)
        rows=cursor.fetchall()
        if(len(rows)>0):
            return output.error("Documents already exist!")
        
        CategoryID=ListCategoryID.split(',')
        for i in range(len(CategoryID)):
            query = "select * from category where ID = '"+CategoryID[i]+"'"
            cursor.execute(query)
            rows = cursor.fetchall()
            if(len(rows)<1):
                return output.error("Incorrect Category ID")
        query="INSERT INTO documents (Name, Author, Description, Category) VALUES ('"+Name+"', '"+Author+"', '"+Description+"', '"+ListCategoryID+"')"
        cursor.execute(query)
        connection.commit()
        query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
        cursor.execute(query)
        rows = cursor.fetchall()
        DocumentsID = rows[0][0]
        for i in range(len(CategoryID)):
            query="INSERT INTO category_documents (CategoryID, DocumentsID) VALUES ("+str(CategoryID[i])+", "+str(DocumentsID)+")"
            cursor.execute(query)
            connection.commit()
        
        query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.execute("DESCRIBE documents")
        cols = cursor.fetchall()
        output.log(token_handle.tokentoStudentID(token), rows[0][0], "Add Documents!" )
        return output.tabletojson(cols, rows, "Successfully!")
        
    else:
        return output.error("You are not authorized to perform this action!")

def delete(token, DocumentsID):
    if(token_handle.tokenadmin(token)):
        query = "select * from documents where ID = "+DocumentsID
        cursor.execute(query)
        rows=cursor.fetchall()
        if(len(rows)>0):
            query="select * from document where DocumentsID = "+DocumentsID+" and status = 'not available'"
            cursor.execute(query)
            rows=cursor.fetchall()
            if(len(rows)>0):
                return output.error("There are some documents that have been borrowed!")
            query="DELETE FROM document where DocumentsID = "+DocumentsID
            cursor.execute(query)
            connection.commit()
            query="DELETE FROM category_documents where DocumentsID = "+DocumentsID
            cursor.execute(query)
            connection.commit()
            query="DELETE FROM documents where ID = "+DocumentsID
            cursor.execute(query)
            connection.commit()
            output.log(token_handle.tokentoStudentID(token), DocumentsID, "Delete Documents!" )
            return output.ok("Successfully!")
        else:
            return output.error('Incorrect Documents ID!')
    else:
        return output.error("You are not authorized to perform this action!")


def update(token, ID, Name, Author, Description, ListCategoryID):
    if(token_handle.tokenadmin(token)):
        CategoryID=ListCategoryID.split(',')
        query="select * from documents where ID = '"+ID+"'"
        cursor.execute(query)
        rows=cursor.fetchall()
        if(len(rows)>0):
            for i in range(len(CategoryID)):
                query = "select * from category where ID = '"+CategoryID[i]+"'"
                cursor.execute(query)
                rows = cursor.fetchall()
                if(len(rows)<1):
                    return output.error("Incorrect Category ID")
            query="Update documents set Name = '"+Name+"', Author = '"+Author+"', Description = '"+Description+"' where ID = '"+ID+"'"
            cursor.execute(query)
            connection.commit()
            query="Delete from category_documents where DocumentsID = '"+ID+"'"
            cursor.execute(query)
            connection.commit()
            for i in range(len(CategoryID)):
                query="INSERT INTO category_documents (CategoryID, DocumentsID) VALUES ("+str(CategoryID[i])+", "+str(ID)+")"
                cursor.execute(query)
                connection.commit()
            query="select * from documents where ID = '"+ID+"'"
            cursor.execute(query)
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE documents")
            cols = cursor.fetchall()
            output.log(token_handle.tokentoStudentID(token), ID, "Update Documents!" )
            return output.tabletojson(cols, rows, "Successfully!")
        else:
            return output.error('Incorrect Documents ID!')
    else:
        return output.error("You are not authorized to perform this action!")


def addDoc(token, ID, DocumentsID, Reprint):
    if(token_handle.tokenadmin(token)):
        query="select * from documents where ID = '"+DocumentsID+"'"
        cursor.execute(query)
        rows=cursor.fetchall()
        if(len(rows)>0):
            query="select * from document where ID = '"+ID+"'"
            cursor.execute(query)
            rows=cursor.fetchall()
            if(len(rows)>0):
                return output.error("Documents already exist")
            query="INSERT INTO document (ID, DocumentsID, Reprint) VALUES ('"+ID+"', '"+DocumentsID+"', '"+Reprint+"')"
            cursor.execute(query)
            connection.commit()
            query="select * from document where ID = '"+ID+"'"
            cursor.execute(query)
            rows = cursor.fetchall()
            cursor.execute("DESCRIBE document")
            cols = cursor.fetchall()
            output.log(token_handle.tokentoStudentID(token), ID, "Update Documents!" )
            return output.tabletojson(cols, rows, "Successfully!")
        else:
            return output.error('Incorrect Documents ID!')
    else:
        return output.error("You are not authorized to perform this action!")