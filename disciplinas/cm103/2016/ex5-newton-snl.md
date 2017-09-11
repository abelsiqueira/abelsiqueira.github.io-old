---
layout: post
title: Implementação do Método de Newton para SNL
---

Implemente o Método de Newton para Sistemas Não-Lineares.

A cara do método tem que ser

```julia
function newton_snl(F, J, x; tol=1e-6, maxiter=1000)
    ...
    return x, Fx, iter
end
```

Teste com
[teste_newton_snl.jl]({{ site.baseurl }}/disciplinas/cm103/teste_newton_snl.jl).

Entrega: 19/Set
