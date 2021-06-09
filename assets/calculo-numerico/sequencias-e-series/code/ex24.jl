# This file was generated, do not modify it. # hide
F(n) = n <= 2 ? min(1, max(n, 0)) : F(n-1) + F(n-2)

for n = 1:20
    println("F_$n = $(F(n))")
end