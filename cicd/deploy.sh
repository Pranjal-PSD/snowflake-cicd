#!/bin/bash

echo "🚀 Starting deployment to Snowflake..."

# Use GitHub Secrets or fallback defaults
ACCOUNT="${SNOWFLAKE_ACCOUNT:-TEWNAEX-QQ42202}"
USER="${SNOWFLAKE_USER:-PRANJALDBT}"
PASSWORD="${SNOWFLAKE_PASSWORD}"
ROLE="${SNOWFLAKE_ROLE:-ACCOUNTADMIN}"
WAREHOUSE="${SNOWFLAKE_WAREHOUSE:-PRANJAL_COMPUTE_WH}"
DATABASE="${SNOWFLAKE_DATABASE:-PRANJAL}"
SCHEMA="${SNOWFLAKE_SCHEMA:-PUBLIC}"

# Execute SQL files
for file in dev/*.sql; do
  echo "📄 Executing $file"
  snowsql -a "$ACCOUNT" \
          -u "$USER" \
          -p "$PASSWORD" \
          -r "$ROLE" \
          -w "$WAREHOUSE" \
          -d "$DATABASE" \
          -s "$SCHEMA" \
          -f "$file"
done

echo "✅ Deployment complete."
