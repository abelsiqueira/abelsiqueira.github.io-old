#!/bin/bash

for problem in $(cat cutest.list)
do
  julia cutest.jl $problem
done
