# This file was generated, do not modify it. # hide
m31 = A[3,1]/A[1,1]
A[3,:] = A[3,:] - m31*A[1,:]
b[3] = b[3] - m31*b[1]

[A b]