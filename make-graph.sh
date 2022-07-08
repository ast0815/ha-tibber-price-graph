#!/bin/bash

read TOKEN <token

curl \
-H "Authorization: Bearer $TOKEN" \
-H "Content-Type: application/json" \
-X POST \
-d  '{ "query": "{viewer{homes{currentSubscription{priceInfo{today{startsAt total} tomorrow{startsAt total}}}}}}"}' \
https://api.tibber.com/v1-beta/gql >data.json
<data.json jq  -r '.data.viewer.homes[0].currentSubscription.priceInfo.today[] | [.startsAt[11:19], .total] | @csv' >today.dat
<data.json jq  -r '.data.viewer.homes[0].currentSubscription.priceInfo.tomorrow[] | [.startsAt[11:19], .total] | @csv' >tomorrow.dat
gnuplot plot
