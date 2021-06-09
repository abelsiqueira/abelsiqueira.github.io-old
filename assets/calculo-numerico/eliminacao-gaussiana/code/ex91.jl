# This file was generated, do not modify it. # hide
A = rand(3, 3)
L, U = declu(copy(A))
norm(L * U - A)