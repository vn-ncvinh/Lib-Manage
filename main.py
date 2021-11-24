from object import books
from object import account
from object import borrow
from server import process
import flask
from flask import request


app = flask.Flask(__name__)
app.config["DEBUG"] = True
app.config['JSON_AS_ASCII'] = False



@app.route('/')
def home():
    return '''<h1>Lib Manage</h1>
<p>API for Libmanage.</p>'''


# Login API

@app.route('/api/login', methods=['POST', 'GET'])
def login():
    if 'username' in request.args and 'password' in request.args:
        username = request.args['username']
        password = request.args['password']
    else:
        return process.page404
    return account.login(username,password)


# Books API

@app.route('/api/books/all', methods=['POST','GET'])
def allbooks():
    if 'token' in request.args:
        token = request.args['token']
        if account.checktoken(token):
            return books.allbooks(token)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.error


@app.route('/api/books/search', methods=['POST', 'GET'])
def searchbooks():
    if 'token' in request.args:
        token = request.args['token']
        if (account.checktoken(token)):
            if 'name' in request.args:
                name = request.args['name']
                return books.searchbookswithname(name, token)
            else:
                if 'author' in request.args:
                    author = request.args['author']
                    return books.searchbookswithauthor(author,token)
                else:
                    return process.page404
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404

@app.route('/api/books/category', methods=['POST', 'GET'])
def getcategory():
    if 'token' in request.args:
        token = request.args['token']
        if (account.checktoken(token)):
            return books.getcategory(token)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404


# Borrow book API

@app.route('/api/borrow/request', methods=['POST', 'GET'])
def borrowbook():
    if 'token' in request.args and 'documentsid' in request.args:
        token = request.args['token']
        documentsid = request.args['documentsid']
        if (account.checktoken(token)):
            return borrow.borrowbook(token,documentsid)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404

@app.route('/api/borrow/cancel', methods=['POST', 'GET'])
def cancel():
    if 'token' in request.args and 'borrowID' in request.args:
        token = request.args['token']
        borrowID = request.args['borrowID']
        if (account.checktoken(token)):
            return borrow.cancel(token,borrowID)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404

@app.route('/api/borrow/all', methods=['POST', 'GET'])
def allborrow():
    if 'token' in request.args:
        token = request.args['token']
        if (account.checktoken(token)):
            return borrow.viewall(token)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404


@app.route('/api/borrow/confirm', methods=['POST', 'GET'])
def confirm():
    if 'token' in request.args and 'borrowID' in request.args:
        token = request.args['token']
        borrowID = request.args['borrowID']
        if (account.checktoken(token)):
            return borrow.confirm(token,borrowID)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404

@app.route('/api/borrow/return', methods=['POST', 'GET'])
def returndocument():
    if 'token' in request.args and 'documentID' in request.args:
        token = request.args['token']
        documentID = request.args['documentID']
        if (account.checktoken(token)):
            return borrow.returndocument(token,documentID)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404



# Users API

@app.route('/api/users/all', methods=['POST', 'GET'])
def alluser():
    if 'token' in request.args:
        token = request.args['token']
        if (account.checktoken(token)):
            return account.viewall(token)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404

@app.route('/api/users/create', methods=['POST', 'GET'])
def createuser():
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
        if (account.checktoken(token)):
            return account.createuser(token, StudentID, Password, Fullname, PhoneNumber, Specialization, Class, Admin)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404

@app.route('/api/users/del', methods=['POST', 'GET'])
def deluser():
    if 'token' in request.args and 'StudentID' in request.args:
        token = request.args['token']
        StudentID = request.args['StudentID']
        if (account.checktoken(token)):
            return account.deluser(token,StudentID)
        else:
            return process.error("Incorrect Token!")
    else:
        return process.page404



if __name__ == '__main__':
    app.run(port=8080)