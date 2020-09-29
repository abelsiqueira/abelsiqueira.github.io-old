---
layout: disciplina
parent: cm106-2020s1
---

# Projeto de modelagem para otimização não linear

Seu grupo deve escolher algum problema, fazer sua modelagem em alguma linguagem de modelagem e resolver esse problema com algum software proprietário.

- Grupos de até 3 pessoas
- Vocês devem escrever um relatório (5 a 10 páginas, sem capa) e apresentar o projeto com slides
- A implementação pode ser em qualquer linguagem, desde que seja de linguagem de modelagem (JuMP, AMPL, PyOMO, GAMS, AIMMS, etc.)
- A resolução do problema deve ser feita por solvers de alta qualidade (KNITRO, IPOPT, MOSEK, GUROBI, Juniper, etc.)
- Baixe versões _trial_ ou acadêmicas dos solvers fechados para fazer seus testes. Algumas versões trial têm limite de tempo, então recomendo ao menos um membro do grupo esperar antes de pedir a versão a trial
- O problema não pode ser linear, mas pode ser quadrático, e pode ter variáveis inteiras. Cuidado na escolha do solver, já que nem todos solvers podem resolver todos os problemas
- O problema não pode ser pequeno. Perto de centenas de variáveis é o ideal
- O problema deve ser complexo o suficiente para justificar o uso de linguagem de modelagem
  - Um problema onde as variáveis têm apenas um índice, por exemplo, é um problema ruim
