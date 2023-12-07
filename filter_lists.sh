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
  neg_list="$1/${name}_neg_list_video.txt"
  pos_list="$1/${name}_pos_list_video.txt"
  if [ -f "$fname" ];
  then
    grep "0," $fname | sed 's/0,/1,/g' > $neg_list
    echo "$name: created $neg_list"
    grep "1," $fname | sed 's/1,/0,/g' > $pos_list
    echo "$name: created $pos_list"
  fi
done
