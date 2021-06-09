# This file was generated, do not modify it. # hide
for n = 10:14
    global E # hide
    setprecision(2^n)

    E = max(abs(pi_madhava_BF() - BigFloat(pi)), eps(BigFloat))
    casas = round(Int, -log10(E))
    println("Com $(2^n) bits obtive $casas casas")
end