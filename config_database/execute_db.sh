#!/bin/bash

DB_USER=$1
DB_PWS=$2
DB_NAME=$3

echo "DROP DATABASE IF EXISTS $DB_NAME"
mysql -u $DB_USER -p$DB_PWS -e "DROP DATABASE IF EXISTS $DB_NAME"

#DIR="$( cd "$( dirname "${BASH_SOURCE[1]}" )" && pwd )"
DIR="/vagrant/bundle/config_database/sql_scripts"

echo "CREATE DATABASE $DB_NAME"
mysql -u $DB_USER -p$DB_PWS -e "CREATE DATABASE $DB_NAME"

for file in ${DIR}/*.sql; do
    echo "Executing $file.."
    mysql -u $DB_USER -p$DB_PWS $DB_NAME < $file

done
