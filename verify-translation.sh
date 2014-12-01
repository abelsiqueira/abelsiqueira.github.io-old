#!/bin/bash
langs=$(ls _posts)

for lang in $langs
do
  for post in $(ls _posts/$lang)
  do
    name=$(awk '/name:/ {print $2; exit}' _posts/$lang/$post)
    [ -z "$name" ] && continue
    for other_lang in $langs
    do
      [ $lang == $other_lang ] && continue
      if [ -z "$(grep "name: \+$name" _posts/$other_lang/*)" ]; then
        echo -e "\033[0;34m$post\033[0m has no translation from \
\033[0;32m$lang\033[0m to \033[0;31m$other_lang\033[0m"
      fi
    done
  done
done
