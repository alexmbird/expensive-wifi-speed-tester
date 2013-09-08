#!/bin/bash

set -e


while /usr/bin/true
do
  date=`/bin/date +%s`
  rslt=`sudo fping -e google.com | awk '{print $4;}' | cut '-d(' -f2`
  if [ "$rslt" == "" ]; then
    line="${date}\tFAIL"
  else
    line="${date}\t${rslt}"
  fi
  echo -e "$line"
  sleep 10
done

