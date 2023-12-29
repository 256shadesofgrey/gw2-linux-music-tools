#!/bin/bash

if [ -z $1 ]; then
  echo "Usage: "$0" input.sh > output.sh"
  exit
fi

cat $1 | awk '{if($2 ~ /^key.*/){if($3 == 9) {$3 = 0} else if($3 == 0) {$3 = 9}}}{print}'
