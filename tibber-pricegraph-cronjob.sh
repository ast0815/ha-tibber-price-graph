#!/bin/bash

cd /root/share/tibber-plots
./make-graph.sh
mv prices.* /root/config/www/plots/
