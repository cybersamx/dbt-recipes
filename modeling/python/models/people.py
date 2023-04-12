import pandas as pd


def model(dbt, fal):
    dbt.config(
        materialized='table',
        packages=['pandas'],
    )

    source_data = {
        'id': [1, 2, None],
        'name': ['George Lam', 'Sanjay Patel', None],
        'company': ['Acme Inc', None, None],
    }

    return pd.DataFrame(source_data)
