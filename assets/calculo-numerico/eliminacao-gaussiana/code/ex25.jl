# This file was generated, do not modify it. # hide
x = zeros(3)
x[3] = b[3] / A[3,3]
x[2] = (b[2] - A[2,3] * x[3]) / A[2,2]
x[1] = (b[1] - A[1,3] * x[3] - A[1,2] * x[2]) / A[1,1]
x