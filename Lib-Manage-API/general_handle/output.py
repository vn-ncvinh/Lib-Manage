from general_handle.dbc import connection, cursor
from general_handle import string_handle

page404 = "<title>404 Not Found</title>\n<h1>Not Found</h1>\n<p>The requested URL was not found on the server. If you entered the URL manually please check your spelling and try again.</p>"

def tabletojson(cols, rows, message):
    result='{"status":"OK", "message":"'+message+'", "data":['
    for row in rows:
        result = result + '{'
        for col in cols:
            result = result + '"'+str(col[0])+'": "'+str(row[cols.index(col)])+'",'
        result = result[:(len(result)-1)]
        result = result + '},'
    if(result[len(result)-1]==','):
        result = result[:(len(result)-1)]
    result = result + ']}'
    # print(result)
    return string_handle.tojson(result)

def log(source, destination, content):
    cursor.execute('INSERT INTO log (Source, Content, Destination, Time) values ("'+source+'","'+content+'","'+destination+'", current_date())')
    connection.commit()

def error(message):
    return string_handle.tojson('{"status":"ERROR", "message":"'+message+'", "data":[]}')

def ok(message):
    return string_handle.tojson('{"status":"OK", "message":"'+message+'", "data":[]}')