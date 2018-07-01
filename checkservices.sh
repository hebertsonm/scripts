#!/bin/bash
# This script iterates over a list of services and
# is used to determine whether they are running or not.
for service in $(cat myservices.txt); do
systemctl status $service | grep --quiet "running"
if [ $? -eq 0 ]; then
  echo $service "is [ACTIVE]"
else
  echo $service "is [INACTIVE or NOT INSTALLED]"
fi
done
