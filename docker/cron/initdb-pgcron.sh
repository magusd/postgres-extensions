#!/bin/bash

psql --dbname="$DB" -c "
    CREATE EXTENSION IF NOT EXISTS pg_cron;
    CREATE SCHEMA IF NOT EXISTS cron;
"