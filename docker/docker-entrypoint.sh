#!/usr/bin/env bash

SCRIPT=$(basename $0)

function usage(){
    echo -e "\nUSAGE: $SCRIPT init|run \n"
    exit 1
}

function superset_init(){
  # Create an admin user
  echo "Step 1 Starting Setting up admin user ( admin / admin )"
  superset fab create-admin \
                --username admin \
                --firstname Superset \
                --lastname Admin \
                --email admin@superset.com \
                --password admin
  echo "Step 1 Complete Setting up admin user"
  
  # Initialize the database
  echo "Step 2 Starting Applying DB migrations"
  superset db upgrade
  echo "Step 2 Complete Applying DB migrations"
  
  # Create default roles and permissions
  echo "Step 3 Starting Setting up roles and perms"
  superset init
  echo "Step 3 Complete Setting up roles and perms"
}

function superset_run(){
  superset run -h 0.0.0.0 -p 8088 --with-threads
}

export PYTHONPATH=/superset


case $1 in
    init)  
        superset_init
        ;;
    run)  
        superset_run
        ;;
    *)  
        usage
        ;;
esac