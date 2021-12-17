from run import app
from flask import request
from general_handle import sqli, output, token_handle
from Data_handle.admin import account, borrow, documents
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

