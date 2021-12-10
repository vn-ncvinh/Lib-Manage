from run import app

@app.route('/')
def home():
    return '''<h1>Lib Manage</h1>
<p>API for Libmanage.</p>'''
