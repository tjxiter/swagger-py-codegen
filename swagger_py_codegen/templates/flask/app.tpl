#! /usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import

from flask import Flask
from flask_login import LoginManager
from {{ blueprint }} import api


SECRET_KEY = 'THIS IS NEED TO BE SECRET'

def create_app():
    app = Flask(__name__, static_folder='static')
    app.register_blueprint(
        api.bp,
        url_prefix='/api'+ '{{ base_path }}')

    app.secret_key = SECRET_KEY
    login_manager = LoginManager()
    login_manager.init_app(app)
    return app

if __name__ == '__main__':
    create_app().run(debug=True)
