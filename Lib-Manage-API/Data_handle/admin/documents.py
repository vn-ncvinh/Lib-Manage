import re
from general_handle.dbc import cursor, connection
from general_handle import output, token_handle

def add(token, Name, Author, Description, ListCategoryID):
    if(token_handle.tokenadmin(token)):
        print(ListCategoryID)
        query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
        cursor.execute(query)
        rows=cursor.fetchall()
        if(len(rows)>0):
            return output.error("Books already exist!")
        # try:
        query="INSERT INTO documents (Name, Author, Description) VALUES ('"+Name+"', '"+Author+"', '"+Description+"')"
        cursor.execute(query)
        connection.commit()
        query="select * from documents where Name = '"+Name+"' and Author = '"+Author+"' and Description = '"+Description+"'"
        cursor.execute(query)
        rows = cursor.fetchall()
        DocumentsID = rows[0][0]
        CategoryID=ListCategoryID.split(',')
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
        # except Exception as e:
        #     return output.error(str(e))
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
            query="DELETE FROM documents where ID = "+DocumentsID
            cursor.execute(query)
            connection.commit()
            output.log(token_handle.tokentoStudentID(token), DocumentsID, "Delete Documents!" )
            return output.ok("Successfully!")
        else:
            return output.error('Incorrect Documents ID!')
    else:
        return output.error("You are not authorized to perform this action!")
