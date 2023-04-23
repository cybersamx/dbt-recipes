{% test positive(model, column_name) %}

    select 1 from {{ model }}
    where not({{ column_name }} >= 0)

{% endtest %}