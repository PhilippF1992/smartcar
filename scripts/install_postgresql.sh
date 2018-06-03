#!/bin/sh
# The script installs postgresql 9.6 and populates User + PWD to the configs.

PostgresUser="${1}"
PostgresPWD="${2}"

if [-z $PostgresUser];
then
PostgresUser=postgres
fi

sudo apt install postgresql libpq-dev postgresql-client postgresql-client-common -y
sudo -u postgres createuser $PostgresUser -P $PostgresPWD --interactive
# Populate config

sudo bash -c 'echo > $PWD/config/database.json' << EOF
{
  "username": "$PostgresUser",
  "password": "$PostgresPWD,
  "database": "smartcar",
  "host": "127.0.0.1",
  "port": 5432,
  "dialect": "postgres"
}
EOF