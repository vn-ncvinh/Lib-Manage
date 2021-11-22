import json

def tojson(cols, rows):
    result='{"status":200, "data":['
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
    return json.loads(result)
