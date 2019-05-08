#!/bin/bash

INPUT=data.cvs
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 1; }
while read -r line
do
  
  URI=$1$(echo $line | awk -F'|' '{printf "%s", $1}' | tr -d '"')
  echo $URI
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' $URI
  if [ $STATUS -nq 200 ]; then
    echo "Got 200! All done!"
    break
  fi
done < $INPUT