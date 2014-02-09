#! /usr/bin/env python

from flask import Flask

app = Flask(__name__)


@app.route('/')
def simple_app():
    return 'Simple statement of success!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
