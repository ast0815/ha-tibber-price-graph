#!/bin/bash

read TOKEN <token

# Get data from Tibber API
curl \
-H "Authorization: Bearer $TOKEN" \
-H "Content-Type: application/json" \
-X POST \
-d  '{ "query": "{viewer{homes{currentSubscription{priceInfo{today{startsAt total} tomorrow{startsAt total}}}}}}"}' \
https://api.tibber.com/v1-beta/gql >data.json

# Prepare csv file with today's prices
<data.json jq  -r '.data.viewer.homes[0].currentSubscription.priceInfo.today[] | [.startsAt[11:19], .total] | @csv' >today.dat

# Prepare csv file with tomorrow's prices
<data.json jq  -r '.data.viewer.homes[0].currentSubscription.priceInfo.tomorrow[] | [.startsAt[11:19], .total] | @csv' >tomorrow.dat

# Prepare vertical line plot of current time
NOW=$(date +%H:%M)
echo "set arrow from '$NOW', graph 0 to '$NOW', graph 1 nohead lt 0" >nowline.gp

# Plot all as svg file
gnuplot plot

# Also convert to png file
convert prices.svg prices.png

# Calculate comparisons
./check-lower-in-pair.sh
