#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER confluencedb;
    CREATE DATABASE confluencedb;
    GRANT ALL PRIVILEGES ON DATABASE confluencedb TO confluencedb;
EOSQL