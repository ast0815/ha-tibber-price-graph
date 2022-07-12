## About

These script allow you to automatically create plots of the future electricity
prices using the Tibber API.

## Instructions

1.  Install and configure the official "Terminal & SSH" plugin for Home Assistant
2.  Configure it to install these additional packages:

    - `gnuplot`
    - `jq`
    - `imagemagick`
    - `ttf-dejavu`

3.  Log into the SSH server on Home Assistant
4.  Clone this repository into `/root/share/tibber-plots/`
5.  Switch to that directory
6.  Create a file `token` that contains your Tibber API token
7.  If you run `./make-graph.sh` now, it should create a plot `prices.svg`
8.  Create the folder `/root/config/www/plots`
9.  Still in `tibber-plots/`, run `./install-cronjob.sh`
10. If you run `/etc/periodic/15min/tibber-pricegraph-cronjob.sh` now, it should create a file `prices.svg` in `/root/config/www/plots/`
11. To add the plot to any of your dashboards, create a Generc Camera and use `http://127.0.0.1:8123/local/plots/prices.png` as the image path.
12. Create a file `ha-token` with a long-lived Home Assistant token for the HTTP sensors.

The plots should be updated every 15 minutes.
You will have to re-do the `install-conjob.sh` step every time the SSH container is restarted.
