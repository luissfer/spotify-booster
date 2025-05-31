#!/bin/bash

#This bash file return the requets for playlist data
source .env

response=$( 
     curl "https://api.spotify.com/v1/playlists/$playlist_id/tracks?offset=500&limit=100" \
     -H "Authorization: Bearer  $access_token"
)

# get playlist data
# jq -r '[.tracks.items[] | {artist: .track.artists[0].name, song: .track.name}]' <<< "$response" > "./data/artistsnamesongs2.json"

# echo -e "\n$name_songs" >> "./data/artistsnamesongs.json"

jq -r '[.items[] | {artist: .track.artists[0].name, song: .track.name}]' <<< "$response" > "./data/artistsnamesongs6.json"
