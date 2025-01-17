#!/bin/bash

# this bash set credentials, and bearer token 
source .env

response=$(
     curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret"
)

# get access_token
access_token=$(jq -r '.access_token' <<< "$response")

echo -e "\naccess_token=$access_token" >> ".env"