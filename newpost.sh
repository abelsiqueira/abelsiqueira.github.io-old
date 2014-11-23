#!/bin/bash

cats=($(grep "^  [a-z]" _config.yml | sed 's/  \(.*\):/\1/g'))
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

filename=$today-$(echo $title | sed 's/- //g' | tr '[:upper:] ' '[:lower:]-').markdown
title=$(for i in $title; do
  if [ ${#i} -gt 2 ]; then
    echo -n $i | sed 's/\(.\).*/\1/g' | tr [:lower:] [:upper:]
    echo $i | sed 's/^.//g'
  else
    echo $i
  fi
done | xargs)

cat > _posts/$filename << EOF
---
layout:     post
title:      $title
date:       $today
categories: ${cats[$(($r-1))]}
name:       $name
---
EOF

vim _posts/$filename
