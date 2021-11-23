from object import books
from object import account
from object import borrow
import flask
from flask import request

app = flask.Flask(__name__)
app.config["DEBUG"] = True
app.config['JSON_AS_ASCII'] = False

page404 = "<title>404 Not Found</title>\n<h1>Not Found</h1>\n<p>The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.</p>"

@app.route('/')
def home():
    return '''<h1>Lib Manage</h1>
<p>API for Libmanage.</p>'''

@app.route('/api/login', methods=['POST'])
def login():
    if 'username' in request.args and 'password' in request.args:
        username = request.args['username']
        password = request.args['password']
    else:
        return page404
    return account.login(username,password)
    
@app.route('/api/books/all', methods=['POST','GET'])
def allbooks():
    if 'token' in request.args:
        token = request.args['token']
    else:
        return page404
    return books.allbooks(token)

@app.route('/api/books/search', methods=['POST'])
def searchbooks():
    if 'token' in request.args:
        token = request.args['token']
        if 'name' in request.args:
            name = request.args['name']
            return books.searchbookswithname(name, token)
        else:
            if 'author' in request.args:
                author = request.args['author']
                return books.searchbookswithauthor(author,token)
    else:
        return page404

@app.route('/api/books/category', methods=['POST'])
def getcategory():
    if 'token' in request.args:
        token = request.args['token']
    else:
        return page404
    return books.getcategory(token)


if __name__ == '__main__':
    app.run(port=8080)