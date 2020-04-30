#!/bin/sh


is_exist=`ps -ef|grep  "app-server" |grep -v grep|awk '{print $2}'|wc|awk '{print $1}'`
echo $is_exist
if [ $is_exist -eq 0 ]
then
    /usr/bin/python /usr/bin/app-server --config-file /etc/app/app.conf --log-file /var/log/app/server.log &
fi
