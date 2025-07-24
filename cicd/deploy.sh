#!/bin/bash

set -e  # Stop on first error

echo "🚀 Starting deployment to Snowflake..."

# Use GitHub Secrets or fallback defaults
ACCOUNT="${SNOWFLAKE_ACCOUNT:-TEWNAEX-QQ42202}"
USER="${SNOWFLAKE_USER:-PRANJALDBT}"
PASSWORD="${SNOWFLAKE_PASSWORD}"
ROLE="${SNOWFLAKE_ROLE:-ACCOUNTADMIN}"
WAREHOUSE="${SNOWFLAKE_WAREHOUSE:-PRANJAL_COMPUTE_WH}"
DATABASE="${SNOWFLAKE_DATABASE:-PRANJAL}"
SCHEMA="${SNOWFLAKE_SCHEMA:-PUBLIC}"

# Confirm SnowSQL is available
if ! command -v snowsql &> /dev/null; then
  echo "❌ snowsql not found in PATH. Aborting."
  exit 1
fi

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
