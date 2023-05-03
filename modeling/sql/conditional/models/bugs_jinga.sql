{%
    set type_priorities = {
        'network': 1,
        'vm': 1,
        'security': 1,
        'data': 2,
        'api': 2,
        'web': 3,
        'mobile': 3,
    }
%}

{% set default_type_priority = 4 %}

select
    title,
    type,
    case
    {% for type in type_priorities %}
        when type = '{{ type }}' then {{ type_priorities[type] }}
    {% endfor %}
        else {{ default_type_priority }}
    end as assigned_priority
from
    {{ ref('bugs') }}
