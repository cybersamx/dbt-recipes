# DBT Commandline

## Subcommands

### test

Let's use the [test/generic/seeds](../test/generic/seeds) project as an example.

| Command                                          | Notes                                                                                           |
|--------------------------------------------------|-------------------------------------------------------------------------------------------------|
| `dbt test `                                      | Run all tests in the project.                                                                   |
| `dbt test --select raw_customers`                | Run tests for the model `raw_customers`.                                                        |
| `dbt test --select raw_customers+`               | Run all tests for the downstream (including the model) of the model `raw_customers`.            |
| `dbt test --select +raw_customers`               | Run all tests for the upstream (including the model) of the model `raw_customers`.              |
| `dbt test --select config.materialized:view`     | Run all tests on the project that are configured with view materilization.                      |
| `dbt test --select source:dbt_recipes`           | Run all tests on the project for the source `dbt_recipes`. See note 1.                          |
| `dbt test --select source:dbt_recipes.customers` | Run all tests on the project for the table `customers` in the source `dbt_recipes`. See note 1. |

1. Run this command in the [source/basic](../source/basic) project.
1. Flag `-s` may be substituted with `--select`.
