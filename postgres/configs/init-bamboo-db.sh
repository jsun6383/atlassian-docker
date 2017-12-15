#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER bamboodb;
    CREATE DATABASE bamboodb;
    GRANT ALL PRIVILEGES ON DATABASE bamboodb TO bamboodb;
EOSQL