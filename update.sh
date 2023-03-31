#!/bin/bash
# Download latest geoip db's
set -euo pipefail
IFS=$'\n\t'
source config.sh

if [[ -z "$IP2LOC" ]]; then
  echo "ERR: IP2LOC-var not set in config.sh"
  exit 1
fi
if [[ -z "$MAXMIND" ]]; then
  echo "ERR: MAXMIND-var not set in config.sh"
  exit 1
fi

rm -rf "/tmp/geoip"
mkdir -p "/tmp/geoip"
mkdir -p "/usr/local/share/GeoIP"

# IP2Loc
curl --fail --no-progress-meter "https://www.ip2location.com/download/?token=$IP2LOC&file=DB11LITEBIN" -o /tmp/geoip/DB11LITEBIN.zip
cd /tmp/geoip
unzip -o -q DB11LITEBIN.zip
mv IP2LOCATION-LITE-DB11.BIN "/usr/local/share/GeoIP"

curl --fail --no-progress-meter "https://www.ip2location.com/download/?token=$IP2LOC&file=DB11LITEBINIPV6" -o /tmp/geoip/DB11LITEBINIPV6.zip
cd /tmp/geoip
unzip -o -q DB11LITEBINIPV6.zip
mv IP2LOCATION-LITE-DB11.IPV6.BIN "/usr/local/share/GeoIP"

# Maxmind
curl --fail --no-progress-meter "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=$MAXMIND&suffix=tar.gz" -o /tmp/geoip/city.mmdb.tgz
curl --fail --no-progress-meter "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=$MAXMIND&suffix=tar.gz" -o /tmp/geoip/asn.mmdb.tgz

tar -zxf /tmp/geoip/city.mmdb.tgz -C /tmp/geoip --strip-components=1
tar -zxf /tmp/geoip/asn.mmdb.tgz -C /tmp/geoip --strip-components=1

mv /tmp/geoip/GeoLite2-City.mmdb /usr/local/share/GeoIP/city.mmdb
mv /tmp/geoip/GeoLite2-ASN.mmdb /usr/local/share/GeoIP/asn.mmdb

rm -rf "/tmp/geoip"
