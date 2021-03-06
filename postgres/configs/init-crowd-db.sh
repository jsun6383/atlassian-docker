#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER crowddb;
    CREATE DATABASE crowddb;
    GRANT ALL PRIVILEGES ON DATABASE crowddb TO crowddb;
EOSQL