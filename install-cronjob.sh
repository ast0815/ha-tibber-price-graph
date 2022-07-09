#!/bin/sh

cp tibber-pricegraph-cronjob.sh /etc/periodic/15min/

# Actually start the cron daemon
pkill crond
crond
