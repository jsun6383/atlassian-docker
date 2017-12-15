#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER bitbucketdb;
    CREATE DATABASE bitbucketdb;
    GRANT ALL PRIVILEGES ON DATABASE bitbucketdb TO bitbucketdb;
EOSQL