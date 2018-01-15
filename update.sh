#!/bin/bash
# Download latest geoip db's
set -euo pipefail
IFS=$'\n\t'

rm -rf "/tmp/geoip"
mkdir -p "/tmp/geoip"
mkdir -p "/usr/local/share/GeoIP"

wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBIN" -O /tmp/geoip/DB11LITEBIN.zip
cd /tmp/geoip
unzip -o -q DB11LITEBIN.zip

wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBINIPV6" -O /tmp/geoip/DB11LITEBINIPV6.zip
cd /tmp/geoip
unzip -o -q DB11LITEBINIPV6.zip

rm *.zip
cp -R * "/usr/local/share/GeoIP" && rm -rf "/tmp/geoip"
