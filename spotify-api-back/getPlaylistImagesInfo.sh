#!/bin/bash

#This bash file return the requets for playlist data
source .env

response=$( 
     curl "https://api.spotify.com/v1/playlists/$playlist_id" \
     -H "Authorization: Bearer  $access_token"
)

# get playlist data
imgurl=$(jq -r '.tracks.items[].track.album.images[0].url' <<< "$response")

echo -e "\n$imgurl" >> "/data/images.json"