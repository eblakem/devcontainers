#!/bin/bash

# Start the script to create the DB and user
/scripts/init-db.sh &

# Start SQL Server
/opt/mssql/bin/sqlservr
