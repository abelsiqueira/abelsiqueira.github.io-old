# This file was generated, do not modify it. # hide
ϵ = 1e-12
A = [ϵ 100; 1.0 ϵ]
B = copy(A)
b = A * ones(2)
elim_gauss(A, b, diagtol=0.0)