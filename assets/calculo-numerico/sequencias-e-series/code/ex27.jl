# This file was generated, do not modify it. # hide
phi = (1 + sqrt(5))/2
psi = 1 - phi
F1 = F2 = 1
Fnovo = 1
for n = 3:93
    global F1, F2, Fnovo # hide
    Fn = (phi^n - psi^n)/sqrt(5)
    Fnovo = F1 + F2
    F2 = F1
    F1 = Fnovo
    println("F_$n = $Fnovo, Diferença F_$n = $(Fn - Fnovo)")
end