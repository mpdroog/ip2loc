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
wget -q "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=HIDDEN&suffix=tar.gz" -O /tmp/geoip/city.mmdb.tgz
wget -q "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=HIDDEN&suffix=tar.gz" -O /tmp/geoip/asn.mmdb.tgz

tar -zxf /tmp/geoip/city.mmdb.tgz -C /tmp/geoip --strip-components=1
tar -zxf /tmp/geoip/asn.mmdb.tgz -C /tmp/geoip --strip-components=1

mv /tmp/geoip/GeoLite2-City.mmdb /usr/local/share/GeoIP/city.mmdb
mv /tmp/geoip/GeoLite2-ASN.mmdb /usr/local/share/GeoIP/asn.mmdb

cp -R * "/usr/local/share/GeoIP" && rm -rf "/tmp/geoip"
