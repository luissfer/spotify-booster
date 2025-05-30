#!/bin/bash

#This bash file return the requets for playlist data
#source .env

response=$( 
     curl "https://api.spotify.com/v1/playlists/$playlist_id" \
     -H "Authorization: Bearer  $access_token"
)

# get playlist data
all=$(jq -r '.tracks.total' <<< "$response")

echo -e "\n$all" >> "/data/totaltracks.json"