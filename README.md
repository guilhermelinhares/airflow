### Description
- Poc to implementation Airflow and keycloak with webserver integration on OIDC provider

Docker Compose
- curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.7.3/docker-compose.yaml'

### Setting the right Airflow user
#### On Linux, the quick-start needs to know your host user id and needs to have group id set to 0. Otherwise the files created in dags, logs and plugins will be created with root user ownership. You have to make sure to configure them for the docker-compose:

- mkdir -p ./dags ./logs ./plugins ./config
- echo -e "AIRFLOW_UID=$(id -u)" > .env

#### Initialize 

- docker compose up airflow-init

- docker compose up


### References

- https://blog.devgenius.io/airflow-authentication-with-rbac-and-keycloak-2c34d2012059
- https://airflow.apache.org/docs/apache-airflow/stable/howto/docker-compose/index.html