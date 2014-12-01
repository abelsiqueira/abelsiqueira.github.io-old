#!/bin/bash
[ $# -lt 1 ] && echo "Need post to translate" && exit 1
[ $# -lt 2 ] && echo "Need translate language target" && exit 1
post=$1
other_lang=$2
[ ! -f $post ] && echo "$post is not a file" && exit 1
[ ! -d _posts/$other_lang ] && echo "$other_lang is not a folder on _posts" && \
  exit 1

name=$(awk '/name:/ {print $2; exit}' $post)
g=$(grep "name: \+$name" _posts/$other_lang/*)
if [ ! -z "$g" ]; then
  echo "Post with name '$name' already exists:"
  echo "g"
fi

echo -n "Post title: "
read title

cat=$(awk '/categories:/{print $2}' $post)
date=$(awk '/date:/{print $2}' $post)
filename=$date-$(echo $title | sed 's/- //g' | tr '[:upper:] ' '[:lower:]-' |\
  sed 's/://g').markdown
title=$(for i in $title; do
  if [ ${#i} -gt 2 ]; then
    echo -n $i | sed 's/\(.\).*/\1/g' | tr [:lower:] [:upper:]
    echo $i | sed 's/^.//g'
  else
    echo $i
  fi
done | xargs)

cat > _posts/$other_lang/$filename << EOF
---
layout:     post
title:      ${title//:/&#58}
date:       $date
categories: $cat
name:       $name
---
EOF

vim _posts/$other_lang/$filename
