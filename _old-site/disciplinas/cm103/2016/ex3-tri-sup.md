---
layout: disciplina
title: Resolução de sistema triangular superior
---

- Implemente a resolução de sistema triangular superior num arquivo chamado
`tri_sup.jl`.
- Sua função deve se chamar `tri_sup`, deve receber `U` e `c`,
  e retornar `x` tais que o sistema linear `Ux = c` seja resolvido,
  onde `U` é triangular superior. Você pode assumir que a diagonal de `U` não é
  zero.
- Baixe [este arquivo](teste_tri_sup.jl) para testar seu código. Para rodá-lo,
coloque na mesma pasta que ser arquivo e faça

{% highlight julia %}
include("teste_tri_sup.jl")
{% endhighlight %}

deve aparecer

{% highlight julia %}
Exemplo da sala
3 facts verified.
Vários exemplos aleatórios
40 facts verified.
{% endhighlight %}

- Calcule a complexidade da resolução do sistema triangular superior.
