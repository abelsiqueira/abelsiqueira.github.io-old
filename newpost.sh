#!/bin/bash

langs=($(grep "^  [a-z]" _config.yml | sed 's/  \(.*\):/\1/g'))
N=${#langs[@]}
for ((i = 0; i < $N; i++))
do
  lang=${langs[$i]}
  line_number[$i]=$(grep "^  $lang" -n _config.yml | awk -F: '{print $1}')
done
line_number[$N]=$(($(wc -l _config.yml | awk '{print $1}')+1))

l=0
while [ $l -lt 1 -o $l -gt $N ]; do
  echo "Choose a language for this new post:"
  for i in $(seq 0 $(($N-1)))
  do
    echo $(($i+1)) ${langs[$i]}
  done
  read l
  if [ $l -lt 1 -o $l -gt $N ]; then
    echo "Choose a number between 1 and $N"
  fi
done
lang=${langs[$(($l-1))]}

begin=$((${line_number[$(($l-1))]}+1))
end=$((${line_number[$l]}-1))
sedcmd="${begin},${end}p"

cats=($(sed $sedcmd _config.yml -n | grep -v backto | grep -v home | grep -v "      " |\
  sed 's/^    \(.*\):/\1/g'))
N=${#cats[@]}

r=0
while [ $r -lt 1 -o $r -gt $N ]; do
  echo "Choose a category for this new post:"
  for i in $(seq 0 $(($N-1)))
  do
    echo $(($i+1)) ${cats[$i]}
  done
  read r
  if [ $r -lt 1 -o $r -gt $N ]; then
    echo "Choose a number between 1 and $N"
  fi
done

echo -n "Post title: "
read title
echo -n "Post name (no spaces, unique): "
read name

today=$(date +"%Y-%m-%d")
filename=$today-$(echo $title | sed 's/- //g' | tr '[:upper:] ' '[:lower:]-' |\
  sed 's/://g').markdown
title=$(for i in $title; do
  if [ ${#i} -gt 2 ]; then
    echo -n $i | sed 's/\(.\).*/\1/g' | tr [:lower:] [:upper:]
    echo $i | sed 's/^.//g'
  else
    echo $i
  fi
done | xargs)

cat > _posts/$lang/$filename << EOF
---
layout:     post
title:      ${title//:/&#58}
date:       $today
categories: ${cats[$(($r-1))]}
name:       $name
---
EOF

vim _posts/$lang/$filename
