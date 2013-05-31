#!/bin/bash

if [ $1 ] 
  then
	largename=$1
  else
	largename="large"
fi


killall 4s-backend 
killall 4s-httpd
cd 4store-filter-slow/
bin/4s-backend $largename"filter"
bin/4s-httpd -s -1 -p 8022 $largename"filter"
bin/4s-backend smallfilter
bin/4s-httpd -s -1 -p 8021 smallfilter
cd ../4store-bgp-slow/
bin/4s-backend $largename"bgp"
bin/4s-backend smallbgp
bin/4s-httpd -s -1 -p 8012 $largename"bgp"
bin/4s-httpd -s -1 -p 8011 smallbgp
ps ux | grep 4s

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8011/status/

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8012/status/

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8021/status/

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8022/status/

exit 0