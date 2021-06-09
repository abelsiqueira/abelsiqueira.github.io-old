# This file was generated, do not modify it. # hide
phi = (1 + sqrt(5))/2
psi = 1 - phi
for n = 1:20
    Fn = round(Int, (phi^n - psi^n)/sqrt(5))
    println("F_$n = $Fn")
end