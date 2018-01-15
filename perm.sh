#!/bin/bash
# Ensure all is in place with correct permissions
rm -rf "/tmp/geoip"
mkdir -p /usr/local/share/GeoIP
chown -R www-data:www-data /usr/local/share/GeoIP
