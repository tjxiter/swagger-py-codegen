#! /usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import absolute_import, print_function

from flask import request, g

from flask_restplus import Resource
from flask_login import current_user, login_required
from . import rest as api
from .. import schemas
{% for view in views %}


@api.route('{{ view.url }}')
@api.header('X-Ypw-Token', 'auth token header', required=True)
class {{ view.name }}(Resource):

    #decorators = [login_required]

    {%- for method, ins in view.methods.items() %}

    def {{ method.lower() }}(self{{ params.__len__() and ', ' or '' }}{{ params | join(', ') }}):
        {%- for request in ins.requests %}
        print(g.{{ request }})
        {%- endfor %}

        {% if 'response' in  ins -%}
        return {{ ins.response.0 }}, {{ ins.response.1 }}, {{ ins.response.2 }}
        {%- else %}
        pass
        {%- endif %}
    {%- endfor -%}
{% endfor %}
