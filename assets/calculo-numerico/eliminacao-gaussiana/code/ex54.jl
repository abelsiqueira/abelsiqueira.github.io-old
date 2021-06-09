# This file was generated, do not modify it. # hide
using Random
Random.seed!(0)
A = rand(4, 4) - rand(4, 4)
b = A * ones(4)
C = [A b]