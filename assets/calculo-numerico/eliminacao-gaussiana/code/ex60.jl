# This file was generated, do not modify it. # hide
m = C[4,3] / C[3,3]
C[4,4:5] .-= m * C[3,4:5]
C[4,3] = 0.0
C