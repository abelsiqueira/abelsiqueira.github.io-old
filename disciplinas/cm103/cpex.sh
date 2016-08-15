#!/bin/bash

dir=$(find ~ -maxdepth 1 -type d -name "disciplinas" | head -n 1)

for f in $dir/cm103/exercicios/*.md
do
  echo "Copiando $f"
  cp $f .
done
