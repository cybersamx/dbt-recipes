{% for i in range(7) %}
    select {{ i }} as n {% if not loop.last %} union all {% endif %}
{% endfor %}


