#!/bin/bash

read TOKEN <token

curl \
-H "Authorization: Bearer $TOKEN" \
-H "Content-Type: application/json" \
-X POST \
-d  '{ "query": "{viewer{homes{currentSubscription{priceInfo{today{startsAt total energy tax}}}}}}"}' \
https://api.tibber.com/v1-beta/gql | \
jq  -r '.data.viewer.homes[0].currentSubscription.priceInfo.today[] | [.startsAt[11:19], .total, .energy, .tax] | @csv' >data.txt
gnuplot plot
