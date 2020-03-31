#!/bin/bash

export DISPLAY=:1
source /opt/intel/openvino/bin/setupvars.sh
/usr/local/bin/vnc_env.sh start >/dev/null 2>/tmp/vnc-server.txt &

CUR_TIME=$(date "+%Y%m%d%H%M%S")
if [ ! -d "/record_frames/logs/" ]
then
    mkdir -p /record_frames/logs
fi

is_exist=`ps -ef|grep  "StaticCameraProcess.py" |grep -v grep|awk '{print $2}'|wc|awk '{print $1}'`
echo $is_exist
if [ $is_exist -eq 0 ] 	
then
    cd /opt/staticcamera/test/
    args="python3 /opt/staticcamera/StaticCameraProcess.py --file /opt/staticcamera/configmap/StaticCameraConfiguration.json"
    nohup $args >/record_frames/logs/sc-top-$CUR_TIME.txt
fi
