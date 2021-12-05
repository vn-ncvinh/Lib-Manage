import json
import hashlib
from server import db

page404 = "<title>404 Not Found</title>\n<h1>Not Found</h1>\n<p>The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.</p>"

def sqli(str):
    # print(str)
    detection = ['OR ', 'SELECT ', 'FROM ', 'WHERE ', 'DROP ', 'DELETE ', 'UPDATE ', 'AND ']
    for detect in detection:
        if detect in str.upper():
            return True
    return False

def checksqli(arr):
    for arg in arr:
        if sqli(arr[arg]):
            return True
    return False

def strtomd5(str):
    return hashlib.md5(str.encode('utf-8')).hexdigest().upper()

def strtojson(str):
    return json.loads(str)

def tabletojson(cols, rows, message):
    result='{"status":"OK", "data":['
    for row in rows:
        result = result + '{'
        for col in cols:
            result = result + '"'+str(col[0])+'": "'+str(row[cols.index(col)])+'",'
        result = result[:(len(result)-1)]
        result = result + '},'
    if(result[len(result)-1]==','):
        result = result[:(len(result)-1)]
    result = result + '], "message":"'+message+'"}'
    # print(result)
    return strtojson(result)

def log(source, destination, content):
    db.cursor.execute('INSERT INTO log (Source, Content, Destination, Time) values ("'+source+'","'+content+'","'+destination+'", current_date())')
    db.connection.commit()

def error(message):
    return strtojson('{"status":"ERROR", "data":[], "message":"'+message+'"}')

def ok(message):
    return strtojson('{"status":"OK", "data":[], "message":"'+message+'"}')