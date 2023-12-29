#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: "$0" input.sh factor > output.sh"
  echo "Where factor is a number with which all delays will be modified (i.e. 0.5 is 2x faster)."
  exit
fi

cat $1 | awk -v f=$2 '{if($1 == "sleep") $2 = $2*f}{print}'
