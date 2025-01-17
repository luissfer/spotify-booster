#!/bin/bash

# this bash set credentials, and bearer token 
source .env

data64=$(
  curl --output - $song_image_url | base64
)

curl --request PUT \
  --url "https://api.spotify.com/v1/playlists/$playlist_id/images" \
  --header "Authorization: Bearer $access_token" \
  --header 'Content-Type: image/jpeg' \
  --data "$data64"