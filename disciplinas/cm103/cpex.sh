#!/bin/bash

dir=$(find ~ -maxdepth 1 -type d -name "disciplinas" | head -n 1)

cp $dir/cm103/exercicios/*.md .
