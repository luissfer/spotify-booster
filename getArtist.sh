#!/bin/bash

#This bash file return the requets for artist data
source .env

curl "https://api.spotify.com/v1/artists/3RKv86Dvl132jbxDVUmXNX?si=BkfEBlb4S4m6yRbm3oj2gA" \
     -H "Authorization: Bearer  $access_token"
