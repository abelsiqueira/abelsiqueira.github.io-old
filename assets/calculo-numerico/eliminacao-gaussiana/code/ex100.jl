# This file was generated, do not modify it. # hide
m = A[3:4,2] / A[2,2]
A[3:4,2] = m
A[3:4,3:4] -= m * A[2,3:4]'
A

#pivô: a₃₃, não há troca
m = A[4,3] / A[3,3]
A[4,3] = m
A[4,4] -= m * A[3,4]
A