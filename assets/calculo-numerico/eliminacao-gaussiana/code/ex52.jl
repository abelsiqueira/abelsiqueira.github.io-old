# This file was generated, do not modify it. # hide
n = 100
A = spdiagm(0 => ones(n))
A[:,1] .= 1
A[1,:] .= 1
A[1,1] = n
A[[1;n],:] = A[[n;1],:]
A