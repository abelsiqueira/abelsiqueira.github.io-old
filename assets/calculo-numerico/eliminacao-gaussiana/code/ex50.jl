# This file was generated, do not modify it. # hide
n = 100
A = spdiagm(0 => ones(n))
A[:,1] .= 1.0
A[1,:] .= 1.0
A[1,1] = n
A