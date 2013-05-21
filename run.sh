#!/bin/bash

if [ $1 ] 
  then
	largename=$1
  else
	largename="large"
fi


killall 4s-backend 
killall 4s-httpd
cd 4store-unmodified/
bin/4s-backend $largename"unmod"
bin/4s-httpd -s -1 -p 8022 $largename"unmod"
bin/4s-backend smallunmod
bin/4s-httpd -s -1 -p 8021 smallunmod
cd ../4store-sleep/
bin/4s-backend $largename"sleep"
bin/4s-backend smallsleep
bin/4s-httpd -s -1 -p 8012 $largename"sleep"
bin/4s-httpd -s -1 -p 8011 smallsleep
ps ux | grep 4s

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8011/status/

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8012/status/

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8021/status/

curl -s -o /dev/null -w "%{url_effective} %{http_code}\n" http://localhost:8022/status/

exit 0