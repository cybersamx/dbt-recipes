def model(dbt, fal):
    dbt.config(
        materialized='table',
        packages=['pandas'],
    )

    df = dbt.ref('people')
    clause = df.company == 'Acme'
    filtered_df = df.where(clause, None)

    return filtered_df
