#create unlogged table

source ./0-common.sh

psql $DATABASE_URL < 1-caching.sql
