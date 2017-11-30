GeoIP lookup
=============

MaxMind
```
wget https://github.com/maxmind/GeoIP2-php/releases/download/v2.7.0/geoip2.phar
```

IP2Location
```
composer install
```

/etc/cron.d/geoip
```
# GeoIP
0 12 * * * root rm /usr/local/share/GeoIP/GeoLite2-City.mmdb; wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz -P /usr/local/share/GeoIP; gzip -d /usr/local/share/GeoIP/GeoLite2-City.mmdb.gz
0 12 * * * root rm /usr/local/share/GeoIP/GeoLite2-Country.mmdb; wget http://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz -P /usr/local/share/GeoIP; gzip -d /usr/local/share/GeoIP/GeoLite2-Country.mmdb.gz

# IP2Loc
0 12 * * * root wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBIN" -O /usr/local/share/GeoIP/ip2loc.zip && cd /usr/local/share/GeoIP && unzip -o -q ip2loc.zip
0 12 * * * root wget -q "http://www.ip2location.com/download/?token=0TZdN4zFJFYvV1crcKnodfdRZPG5C5eDZdRMiqr16qx1rKtEuQ2H6gy65fcIkqmk&file=DB11LITEBINIPV6" -O /usr/local/share/GeoIP/ip2loc.zip && cd /usr/local/share/GeoIP && unzip -o -q ip2loc.zip
```
