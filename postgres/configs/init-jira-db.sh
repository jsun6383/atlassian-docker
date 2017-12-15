#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER jiradb;
    CREATE DATABASE jiradb;
    GRANT ALL PRIVILEGES ON DATABASE jiradb TO jiradb;
EOSQL