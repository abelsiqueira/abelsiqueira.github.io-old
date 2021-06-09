# This file was generated, do not modify it. # hide
A = [1 1e-11; 1e-11 100]
b = A * ones(2)
resolve(A, b) .- 1