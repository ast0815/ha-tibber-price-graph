#!/bin/bash

HOUR=$(date +%H)
OTHER=$(($HOUR + 1 - 2 * ($HOUR % 2)))
NOW_PRICE=$(grep $HOUR:00:00 today.dat | cut -f 2 -d,)
OTHER_PRICE=$(grep $OTHER:00:00 today.dat | cut -f 2 -d,)
echo $NOW_PRICE $OTHER_PRICE
echo "$NOW_PRICE < $OTHER_PRICE" | bc >lower_in_pair
