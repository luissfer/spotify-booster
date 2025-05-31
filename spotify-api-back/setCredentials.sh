#!/bin/bash

# this bash sets credentials and bearer token in postgres
source .env

# Fetch access token from Spotify
response=$(
     curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret"
)

# Parse access_token
access_token=$(jq -r '.access_token' <<< "$response")

# Insert or update in the Postgres container
docker exec -i postgresql-db-setup-db-1 psql -U ${POSTGRES_USER:-postgres} -d ${POSTGRES_DB:-postgres} -c "
INSERT INTO credentials (name, client_id, client_secret, access_token, created_at)
VALUES ('spotify', '$client_id', '$client_secret', '$access_token', NOW())
ON CONFLICT (name) DO UPDATE SET
  access_token = EXCLUDED.access_token,
  created_at = NOW();
"