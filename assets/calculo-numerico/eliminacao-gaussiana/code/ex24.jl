# This file was generated, do not modify it. # hide
m32 = A[3,2]/A[2,2]
A[3,:] = A[3,:] - m32*A[2,:]
b[3] = b[3] - m32*b[2]

[A b]