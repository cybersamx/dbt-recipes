def model(dbt, fal):
    dbt.config(
        materialized='table',
        packages=['pandas'],
    )

    # To use dbt.source(), we need to have sources.yml defined.
    # dbt_recipes is the source name, not the schema name, although
    # we typically name the source name as the schema name.
    df = dbt.source('dbt_recipes', 'companies')
    clause = df.country == 'us'
    filtered_df = df.where(clause)
    filtered_df.drop(['id', 'country'], axis='columns')

    return filtered_df
