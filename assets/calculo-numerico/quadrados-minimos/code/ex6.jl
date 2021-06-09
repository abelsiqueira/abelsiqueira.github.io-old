# This file was generated, do not modify it. # hide
M11 = m
M12 = M21 = sum(x)
M22 = sum(x.^2)
c1 = sum(y)
c2 = sum(x .* y)

M = [M11 M12; M21 M22]
c = [c1; c2]
αβ = M \ c

α, β = αβ[1], αβ[2]