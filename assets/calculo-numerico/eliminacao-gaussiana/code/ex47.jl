# This file was generated, do not modify it. # hide
b = A * ones(2)
elim_gauss(A, b)
x = sist_tri_sup(A, b)
x - ones(2)