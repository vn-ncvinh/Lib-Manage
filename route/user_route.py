from run import app
from flask import request
from general_handle import sqli, output, token_handle
from Data_handle.user import account, borrow, documents

###########
# Account #
###########
@app.route('/api/login', methods=['POST', 'GET'])
def login():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'username' in request.args and 'password' in request.args:
        username = request.args['username']
        password = request.args['password']
    else:
        return output.page404
    return account.login(username,password)

@app.route('/api/logout', methods=['POST', 'GET'])
def logout():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args:
        token = request.args['token']
        if (token_handle.checktoken(token)):
            return account.logout(token)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/user/changepassword', methods = ['POST', 'GET'])
def changepassword():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'token' in request.args and 'old' in request.args and 'new' in request.args:
        token = request.args['token']
        old = request.args['old']
        new = request.args['new']
        if (token_handle.checktoken(token)):
            return account.changepass(token, old, new)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404



#############
# Documents #
#############
@app.route('/api/documents/all', methods=['POST','GET'])
def alldocuments():
    return documents.all()

@app.route('/api/documents/search', methods=['POST', 'GET'])
def searchdocuments():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    if 'key' in request.args:
        key = request.args['key']
        return documents.search(key)
    else:
        return output.page404

@app.route('/api/documents/category', methods=['POST', 'GET'])
def getcategory():
    return documents.category()



##########
# Borrow #
##########
@app.route('/api/borrow/request', methods=['POST', 'GET'])
def borrowbook():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'documentsid' in request.args and 'BorrowingTime' in request.args:
        token = request.args['token']
        documentsid = request.args['documentsid']
        BorrowingTime = request.args['BorrowingTime']
        if (token_handle.checktoken(token)):
            return borrow.request(token,documentsid,BorrowingTime)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404


@app.route('/api/borrow/cancel', methods=['POST', 'GET'])
def cancel():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args and 'borrowID' in request.args:
        token = request.args['token']
        borrowID = request.args['borrowID']
        if (token_handle.checktoken(token)):
            return borrow.cancel(token,borrowID)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404

@app.route('/api/borrow/all', methods=['POST', 'GET'])
def allborrow():
    if sqli.check(request.args):
        return output.error("SQL Injection!")
    
    if 'token' in request.args:
        token = request.args['token']
        if (token_handle.checktoken(token)):
            return borrow.all(token)
        else:
            return output.error("Incorrect Token!")
    else:
        return output.page404