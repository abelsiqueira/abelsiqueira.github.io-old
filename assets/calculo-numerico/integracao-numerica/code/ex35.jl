# This file was generated, do not modify it. # hide
a = 1e-11
simpson_composto(f, -1+a, 1-a, n=1000)

function ponto_medio(f, a, b; n=100)
    #Implemente
end

ponto_medio(exp, 0, 1, n=1000) - (exp(1) - 1)