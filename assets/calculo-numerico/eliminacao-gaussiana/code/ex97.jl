# This file was generated, do not modify it. # hide
m = A[2:4,1] / A[1,1]
A[2:4,1] = m
A[2:4,2:4] -= m * A[1,2:4]'
A