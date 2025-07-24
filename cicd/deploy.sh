<<<<<<< HEAD
#!/bin/bash
set -e

echo "Starting deployment..."

snowsql -a "$SNOWFLAKE_ACCOUNT" \
        -u "$SNOWFLAKE_USER" \
        -p "$SNOWFLAKE_PASSWORD" \
        -d "$SNOWFLAKE_DATABASE" \
        -s "$SNOWFLAKE_SCHEMA" \
        -r "$SNOWFLAKE_ROLE" \
        -w "$SNOWFLAKE_WAREHOUSE" \
        -f dev/create_tables.sql

snowsql -a "$SNOWFLAKE_ACCOUNT" \
        -u "$SNOWFLAKE_USER" \
        -p "$SNOWFLAKE_PASSWORD" \
        -d "$SNOWFLAKE_DATABASE" \
        -s "$SNOWFLAKE_SCHEMA" \
        -r "$SNOWFLAKE_ROLE" \
        -w "$SNOWFLAKE_WAREHOUSE" \
        -f dev/stage_sales_data.sql

snowsql -a "$SNOWFLAKE_ACCOUNT" \
        -u "$SNOWFLAKE_USER" \
        -p "$SNOWFLAKE_PASSWORD" \
        -d "$SNOWFLAKE_DATABASE" \
        -s "$SNOWFLAKE_SCHEMA" \
        -r "$SNOWFLAKE_ROLE" \
        -w "$SNOWFLAKE_WAREHOUSE" \
        -f dev/transform_sales_data.sql
=======

>>>>>>> dbeb7767e2e620eb6aaa1a59d749312178beab76
