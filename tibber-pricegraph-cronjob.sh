#!/bin/bash

cd /root/share/tibber-plots
./make-graph.sh
mv prices.svg /root/config/www/plots/
