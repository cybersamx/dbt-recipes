{% test text_length(model, column_name, length=0) %}

    with condition as (
        select * from {{ model }}
    ),

    validation as (
        select * from condition
        where not(length({{ column_name }}) >= {{ length }})
    )

    select * from validation

{% endtest %}