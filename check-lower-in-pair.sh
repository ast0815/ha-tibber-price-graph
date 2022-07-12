#!/bin/bash

HOUR=$(date +%H)
OTHER=$(($HOUR + 1 - 2 * ($HOUR % 2)))
# Fix zero padding
printf -v OTHER %02g $OTHER
NOW_PRICE=$(grep $HOUR:00:00 today.dat | cut -f 2 -d,)
OTHER_PRICE=$(grep $OTHER:00:00 today.dat | cut -f 2 -d,)

read TOKEN <ha-token

if [[ $(echo "$NOW_PRICE < $OTHER_PRICE" | bc) == "1" ]]
then
    curl -X POST -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"state": "on", "attributes": {"friendly_name": "Electricity Price lower in pair"}}' \
        http://homeassistant.local:8123/api/states/binary_sensor.electricity_price_lower_in_pair
else
    curl -X POST -H "Authorization: Bearer $TOKEN" \
        -H "Content-Type: application/json" \
        -d '{"state": "off", "attributes": {"friendly_name": "Electricity Price lower in pair"}}' \
        http://homeassistant.local:8123/api/states/binary_sensor.electricity_price_lower_in_pair
fi
