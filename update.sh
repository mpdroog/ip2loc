#!/bin/bash
# Download latest geoip db's
set -euo pipefail
IFS=$'\n\t'

rm -rf "/tmp/geoip"
mkdir -p "/tmp/geoip"

# IP2Loc
wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBIN" -O /tmp/geoip/DB11LITEBIN.zip
cd /tmp/geoip
unzip -o -q DB11LITEBIN.zip

wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBINIPV6" -O /tmp/geoip/DB11LITEBINIPV6.zip
cd /tmp/geoip
unzip -o -q DB11LITEBINIPV6.zip

# Maxmind
wget -q "http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz" -O /tmp/geoip/GeoLite2-City.mmdb.gz
gzip -d /tmp/geoip/GeoLite2-City.mmdb.gz -f

rm *.zip
cp -R * "/usr/local/share/GeoIP" && rm -rf "/tmp/geoip"
