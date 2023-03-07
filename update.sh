#!/bin/bash
# Download latest geoip db's
set -euo pipefail
IFS=$'\n\t'

rm -rf "/tmp/geoip"
mkdir -p "/tmp/geoip"
mkdir -p "/usr/local/share/GeoIP"

# IP2Loc
curl --fail --silent --show-error "https://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBIN" -o /tmp/geoip/DB11LITEBIN.zip
cd /tmp/geoip
unzip -o -q DB11LITEBIN.zip
mv IP2LOCATION-LITE-DB11.BIN "/usr/local/share/GeoIP"

curl --fail --silent --show-error "https://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBINIPV6" -o /tmp/geoip/DB11LITEBINIPV6.zip
cd /tmp/geoip
unzip -o -q DB11LITEBINIPV6.zip
mv IP2LOCATION-LITE-DB11.IPV6.BIN "/usr/local/share/GeoIP"

# Maxmind
wget -nv "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=HIDDEN&suffix=tar.gz" -O /tmp/geoip/city.mmdb.tgz
wget -nv "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=HIDDEN&suffix=tar.gz" -O /tmp/geoip/asn.mmdb.tgz

tar -zxf /tmp/geoip/city.mmdb.tgz -C /tmp/geoip --strip-components=1
tar -zxf /tmp/geoip/asn.mmdb.tgz -C /tmp/geoip --strip-components=1

mv /tmp/geoip/GeoLite2-City.mmdb /usr/local/share/GeoIP/city.mmdb
mv /tmp/geoip/GeoLite2-ASN.mmdb /usr/local/share/GeoIP/asn.mmdb

rm -rf "/tmp/geoip"
