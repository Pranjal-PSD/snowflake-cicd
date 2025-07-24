#!/bin/bash

echo "🚀 Starting deployment to Snowflake..."

# Replace with your actual info or pull from environment variables
SNOWSQL_ACCOUNT="${SNOWSQL_ACCOUNT:-TEWNAEX-QQ42202}"
SNOWSQL_USER="${SNOWSQL_USER:-PRANJALDBT}"
SNOWSQL_ROLE="${SNOWSQL_ROLE:-ACCOUNTADMIN}"
SNOWSQL_DATABASE="PRANJAL"
SNOWSQL_WAREHOUSE="PRANJAL_COMPUTE_WH"
SNOWSQL_SCHEMA="PUBLIC"

# Execute SQL files
snowsql -a $SNOWSQL_ACCOUNT \
        -u $SNOWSQL_USER \
        -p "$SNOWSQL_PASSWORD" \
        -r $SNOWSQL_ROLE \
        -w $SNOWSQL_WAREHOUSE \
        -d $SNOWSQL_DATABASE \
        -s $SNOWSQL_SCHEMA \
        -f dev/create_tables.sql

snowsql -a $SNOWSQL_ACCOUNT \
        -u $SNOWSQL_USER \
        -p "$SNOWSQL_PASSWORD" \
        -r $SNOWSQL_ROLE \
        -w $SNOWSQL_WAREHOUSE \
        -d $SNOWSQL_DATABASE \
        -s $SNOWSQL_SCHEMA \
        -f dev/stage_sales_data.sql

snowsql -a $SNOWSQL_ACCOUNT \
        -u $SNOWSQL_USER \
        -p "$SNOWSQL_PASSWORD" \
        -r $SNOWSQL_ROLE \
        -w $SNOWSQL_WAREHOUSE \
        -d $SNOWSQL_DATABASE \
        -s $SNOWSQL_SCHEMA \
        -f dev/transform_sales_data.sql

echo "✅ Deployment complete."
