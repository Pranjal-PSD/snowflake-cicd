#!/bin/bash

echo "🚀 Starting deployment to Snowflake..."

# Use environment variables (you'll map these in GitHub Actions)
ACCOUNT="${SNOWSQL_ACCOUNT}"
USER="${SNOWSQL_USER}"
PASSWORD="${SNOWSQL_PASSWORD}"
ROLE="${SNOWSQL_ROLE:-ACCOUNTADMIN}"
DATABASE="${SNOWSQL_DATABASE:-PRANJAL}"
WAREHOUSE="${SNOWSQL_WAREHOUSE:-PRANJAL_COMPUTE_WH}"
SCHEMA="${SNOWSQL_SCHEMA:-PUBLIC}"

# Execute SQL scripts
for script in dev/*.sql; do
    echo "▶ Running $script..."
    snowsql -a "$ACCOUNT" \
            -u "$USER" \
            -p "$PASSWORD" \
            -r "$ROLE" \
            -d "$DATABASE" \
            -w "$WAREHOUSE" \
            -s "$SCHEMA" \
            -f "$script"
done

echo "✅ Deployment complete."
