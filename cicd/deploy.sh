#!/bin/bash
set -e  # Exit if any command fails

echo "📤 Deploying SQL scripts to Snowflake..."

# Loop over all .sql files in the current directory
for file in dev/*.sql; do
  echo "🔄 Executing: $file"
  snowsql -a "$SNOWFLAKE_ACCOUNT" \
          -u "$SNOWFLAKE_USER" \
          -p "$SNOWFLAKE_PASSWORD" \
          -r "$SNOWFLAKE_ROLE" \
          -w "$SNOWFLAKE_WAREHOUSE" \
          -d "$SNOWFLAKE_DATABASE" \
          -s "$SNOWFLAKE_SCHEMA" \
          -f "$file"
done

echo "✅ Deployment complete."
