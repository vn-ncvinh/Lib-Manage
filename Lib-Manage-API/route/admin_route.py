from run import app
from flask import request
from general_handle import sqli, output, token_handle
from Data_handle.admin import account, borrow, documents, category
###########
# Account #
###########

@app.route('/api/admin/users/all', methods=['POST', 'GET'])
def viewall_user():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args:
        token = request.args['token']
        if (token_handle.checktoken(token)):
            return account.viewall(token)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/users/create', methods=['POST', 'GET'])
def create_user():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'StudentID' in request.args and 'Password' in request.args and 'Fullname' in request.args and 'Specialization' in request.args and 'Class' in request.args and 'Admin' in request.args:
        token = request.args['token']
        StudentID = request.args['StudentID']
        Password = request.args['Password']
        Fullname = request.args['Fullname']
        Specialization = request.args['Specialization']
        Class = request.args['Class']
        Admin = request.args['Admin']
        if 'PhoneNumber' in request.args:
            PhoneNumber = request.args['PhoneNumber']
        else:
            PhoneNumber = "0"
        if (token_handle.checktoken(token)):
            return account.createuser(token, StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/users/delete', methods=['POST', 'GET'])
def delete_user():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'StudentID' in request.args:
        token = request.args['token']
        StudentID = request.args['StudentID']
        if (token_handle.checktoken(token)):
            return account.deluser(token,StudentID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/users/disable', methods=['POST', 'GET'])
def disable_user():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'StudentID' in request.args:
        token = request.args['token']
        StudentID = request.args['StudentID']
        if (token_handle.checktoken(token)):
            return account.disableuser(token,StudentID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/users/active', methods=['POST', 'GET'])
def active_user():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'StudentID' in request.args:
        token = request.args['token']
        StudentID = request.args['StudentID']
        if (token_handle.checktoken(token)):
            return account.activeuser(token,StudentID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/users/update', methods=['POST', 'GET'])
def update_user():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'StudentID' in request.args and 'Password' in request.args and 'Fullname' in request.args and 'Specialization' in request.args and 'Class' in request.args and 'Expiry' in request.args:
        token = request.args['token']
        StudentID = request.args['StudentID']
        Password = request.args['Password']
        Fullname = request.args['Fullname']
        Specialization = request.args['Specialization']
        Class = request.args['Class']
        Expiry = request.args['Expiry']
        if 'PhoneNumber' in request.args:
            PhoneNumber = request.args['PhoneNumber']
        else:
            PhoneNumber = "0"
        if (token_handle.checktoken(token)):
            return account.update(token, StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Expiry)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404


#############
# Documents #
#############

@app.route('/api/admin/documents/add', methods=['POST', 'GET'])
def add_documents():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'Name' in request.args and 'Author' in request.args and 'Description' in request.args and 'ListCategoryID' in request.args:
        token = request.args['token']
        Name = request.args['Name']
        Author = request.args['Author']
        Description = request.args['Description']
        ListCategoryID = request.args['ListCategoryID']
        if (token_handle.checktoken(token)):
            return documents.add(token, Name, Author, Description, ListCategoryID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/documents/delete', methods=['POST', 'GET'])
def delete_documents():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'DocumentsID' in request.args:
        token = request.args['token']
        DocumentsID = request.args['DocumentsID']
        if (token_handle.checktoken(token)):
            return documents.delete(token, DocumentsID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/documents/update', methods=['POST', 'GET'])
def update_documents():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'ID' in request.args and 'Name' in request.args and 'Author' in request.args and 'Description' in request.args and 'ListCategoryID' in request.args:
        token = request.args['token']
        ID = request.args['ID']
        Name = request.args['Name']
        Author = request.args['Author']
        Description = request.args['Description']
        ListCategoryID = request.args['ListCategoryID']
        if (token_handle.checktoken(token)):
            return documents.update(token, ID, Name, Author, Description, ListCategoryID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/documents/addDoc', methods=['POST', 'GET'])
def add_document():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'ID' in request.args and 'DocumentsID' in request.args and 'Reprint' in request.args:
        token = request.args['token']
        ID = request.args['ID']
        DocumentsID = request.args['DocumentsID']
        Reprint = request.args['Reprint']
        if (token_handle.checktoken(token)):
            return documents.addDoc(token, ID, DocumentsID, Reprint)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

############
# Category #
############

@app.route('/api/admin/category/add', methods=['POST', 'GET'])
def add_category():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'Name' in request.args and 'Description' in request.args:
        token = request.args['token']
        Name = request.args['Name']
        Description = request.args['Description']
        if (token_handle.checktoken(token)):
            return category.add(token, Name, Description)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/category/delete', methods=['POST', 'GET'])
def delete_category():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'ID' in request.args:
        token = request.args['token']
        ID = request.args['ID']
        if (token_handle.checktoken(token)):
            return category.delete(token, ID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/category/update', methods=['POST', 'GET'])
def update_category():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'ID' in request.args and 'Name' in request.args and 'Description' in request.args:
        token = request.args['token']
        ID = request.args['ID']
        Name = request.args['Name']
        Description = request.args['Description']
        if (token_handle.checktoken(token)):
            return category.update(token, ID, Name, Description)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404



##########
# Borrow #
##########
@app.route('/api/admin/borrow/all', methods=['POST', 'GET'])
def viewall_borrow():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args:
        token = request.args['token']
        if (token_handle.checktoken(token)):
            return borrow.viewall(token)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/borrow/confirm', methods=['POST', 'GET'])
def confirm_borrow():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'borrowID' in request.args:
        token = request.args['token']
        borrowID = request.args['borrowID']
        if (token_handle.checktoken(token)):
            return borrow.confirm(token,borrowID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/admin/borrow/return', methods=['POST', 'GET'])
def return_borrow():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'documentID' in request.args:
        token = request.args['token']
        documentID = request.args['documentID']
        if (token_handle.checktoken(token)):
            return borrow.returndocument(token,documentID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404


@app.route('/api/admin/borrow/lose', methods=['POST', 'GET'])
def lose_borrow():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'documentID' in request.args:
        token = request.args['token']
        documentID = request.args['documentID']
        if (token_handle.checktoken(token)):
            return borrow.lose(token,documentID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

