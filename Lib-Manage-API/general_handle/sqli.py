def sqli(str):
    # print(str)
    detection = ['OR ', 'SELECT ', 'FROM ', 'WHERE ', 'DROP ', 'DELETE ', 'UPDATE ', 'AND ']
    for detect in detection:
        if detect in str.upper():
            return True
    return False

def check(arr):
    for arg in arr:
        if sqli(arr[arg]):
            return True
    return False