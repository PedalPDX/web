#! /usr/bin/env python2
from flask import Flask

app = Flask(__name__)

@app.route('/')
def homedir():
    return 'A simple statement of success. Go PedalPDX!!!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)

