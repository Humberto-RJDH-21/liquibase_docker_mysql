#!/usr/bin/env bash

gradle startContainer

export STATUS=0
i=0
host="dkr-bd-container"
echo "waiting for MySQL!"
while [[ ${STATUS} -eq 0 ]] && [[ ${i} -lt 60 ]]; do
       sleep 1
       i=$((i+1))
       STATUS=$(docker logs $host 2>&1 | grep "MySQL init process done. Ready for start up" | wc -c)
done
echo "MySQL: Ready for Connections!"

gradle update -PrunList=dev

