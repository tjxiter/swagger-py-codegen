# -*- coding: utf-8 -*-
from __future__ import absolute_import

from flask import Blueprint
import flask_restful as restful
from flask_restplus import Api

from .validators import security


@security.scopes_loader
def current_scopes():
    return {{ scopes_supported }}
