# -*- coding: utf-8 -*-
from __future__ import absolute_import

from flask import Blueprint
import flask_restful as restful
from flask_restplus import Api


bp = Blueprint('{{ blueprint }}', __name__, static_folder='static')
rest = Api(bp, title=u"游品位", description=u"游品位服务端Api接口定义")

# 这几个import必须放最后，否则会导致互相引用
{% for module in modules -%}
import v2.api.{{ module }}
{% endfor %}
