#!/bin/bash
if [ -z "$1" ]
then
  echo "Correct usage: $0 [dataset path]"
  exit 1
fi

echo "Generating separate neg/pos lists for $1"
for name in train dev test;
do
  fname="$1/${name}_list_video.txt"
  if [ -f "$fname" ];
  then
    grep "0," $fname > $1/${name}_neg_list_video.txt
    grep "1," $fname > $1/${name}_pos_list_video.txt
    echo $name
  fi
done
