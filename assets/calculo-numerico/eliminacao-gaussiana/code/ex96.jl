# This file was generated, do not modify it. # hide
A = [ 1  3  0  1;
      2  1  1  1;
     -3 -1 -1 -3;
     -1 -1  0 -1.0]
B = copy(A)
p = [1;2;3;4]

#pivô: a₃₁, L₁ ↔ L₃
p[3], p[1] = p[1], p[3]
A[3,:], A[1,:] = A[1,:], A[3,:]
A