# This file was generated, do not modify it. # hide
A = rand(5,5)
j, k = 2, 5
A[[k;j],:] = A[[j;k],:]
A