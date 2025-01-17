#!/bin/bash

#This bash file return the requets for playlist data
source .env

curl "https://api.spotify.com/v1/playlists/$playlist_id/images" \
     -H "Authorization: Bearer  $access_token" > playlistImageresponse.json
     