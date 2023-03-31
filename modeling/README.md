# Modeling

This project focuses on the modeling aspect of dbt. It contains some examples on modeling.

## Setup

1. Run postgres docker container.

   ```shell
   docker-compose up
   ```

1. Copy the content of [profiles.yml](profiles.yml) and append it to `~/.dbt/profiles.yml`. 

1. Test the project.

   ```shell
   dbt test
   ```

1. Run the project.

   ```shell
   dbt run
   ```

1. Once you done, stop and remove the postgres container.

   ```shell
   docker-compose down
   ```
