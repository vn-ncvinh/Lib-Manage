import json
import hashlib

def toMD5(str):
    return hashlib.md5(str.encode('utf-8')).hexdigest().upper()

def tojson(str):
    result = json.loads(str)
    # print(result)
    return result
