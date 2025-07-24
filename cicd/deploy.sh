name: Deploy to Snowflake (Dev)

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: ⬇️ Checkout Code
        uses: actions/checkout@v3

      - name: 🧊 Install SnowSQL CLI
        run: |
          sudo apt update
          sudo apt install -y wget unzip
          wget https://sfc-repo.snowflakecomputing.com/snowsql/bootstrap/1.2/linux_x86_64/snowsql-1.2.21-linux_x86_64.bash
          bash snowsql-1.2.21-linux_x86_64.bash -y
          echo "$HOME/.snowsql" >> $GITHUB_PATH
          export PATH="$HOME/.snowsql:$PATH"

      - name: 🚀 Run deploy.sh
        env:
          SNOWFLAKE_ACCOUNT: ${{ secrets.SNOWFLAKE_ACCOUNT }}
          SNOWFLAKE_USER: ${{ secrets.SNOWFLAKE_USER }}
          SNOWFLAKE_PASSWORD: ${{ secrets.SNOWFLAKE_PASSWORD }}
          SNOWFLAKE_ROLE: ${{ secrets.SNOWFLAKE_ROLE }}
          SNOWFLAKE_WAREHOUSE: ${{ secrets.SNOWFLAKE_WAREHOUSE }}
          SNOWFLAKE_DATABASE: ${{ secrets.SNOWFLAKE_DATABASE }}
          SNOWFLAKE_SCHEMA: ${{ secrets.SNOWFLAKE_SCHEMA }}
        run: |
          export PATH="$HOME/.snowsql:$PATH"
          chmod +x cicd/deploy.sh
          bash cicd/deploy.sh
