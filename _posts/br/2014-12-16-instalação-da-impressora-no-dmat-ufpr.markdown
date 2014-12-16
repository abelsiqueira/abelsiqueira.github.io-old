---
layout:     post
title:      Instalação da Impressora no DMAT-UFPR
date:       2014-12-16
categories: public-utility
name:       instalacao-da-impressora-no-dmat-ufpr
---
Hoje tive que instalar a impressora do DMAT da UFPR no meu
[archlinux](https://www.archlinux.org/). Infelizmente o suporte técnico da
universidade não dá suporte para essa distribuição (só Ubuntu).
Existe o suporte ao Windows
([aqui](http://www.cce.ufpr.br/portal/suporte-a-impressao/)),
que foi necessário para eu obter algumas informações sobre a impressora.
Tive algum trabalho para achar as configurações corretas, mas acho que consegui,
e vou deixar explicado aqui caso alguém precise.
Infelizmente não refiz os passos a seguir, porque fui costurando até chegar ao
ponto em que a impressora funcionou. No entanto, vou explicar o que me parece
que fez diferença.

Inicialmente, instale o [CUPS](https://wiki.archlinux.org/index.php/CUPS) e o
[SAMBA](https://wiki.archlinux.org/index.php/Samba) e suba-os com o `systemctl`.
__Talvez seja preciso apenas as partes dos clientes do CUPS e do SAMBA__.

Depois disso, entre na [administração do CUPS](http://localhost:631).
O meu estava em inglês, então vou usar uma tradução livre.
Entre em "adicionar impressora". Entre com `root` e a senha do root nessa
administração (ou configure o usuário com o grupo correto).
Agora selecione "Impressora Windows via SAMBA".

A grande dificuldade de instalar a impressora foi descobrir a porcaria da
conexão. Aparentemente, deve ter o formato

    smb://[USUARIO]:[SENHA]@[HOST]/[IMPRESSORA]

O `[HOST]` eu já tinha porque me foi passado anteriormente, mas a gente também
podia pegar no suporte ao Windows da impressora: `impressao01.ufpr.br`.
O `[USUARIO]` e `[SENHA]` são os seus valores locais (por quê?).
Para obter a `[IMPRESSORA]` tive que entrar no Windows pra pegar, seguindo os
passos do suporte ao Windows. **MAS**, parece que podemos obter a lista usando o
comando

    smbclient -L impressao01.ufpr.br

e colocando nossa senha. Vai ser uma lista, então você pode usar `less` pra ler.
Obtive o nome da impressora que eu queria usar e coloquei no lugar:
`DEPTO.MATEMATICA_SALA.PROFESSORES_EXATAS_POLITECNICO`.

Deposi disso, você precisa passar o ppd. Uma busca na web por `linux MARCA
MODELO` retornará um link da [Open Printing](http://www.openprinting.org).
Eu utilizei o modelo C790, mesmo a impressora sendo modelo C792, porque, como
disse, fui costurando um monte de coisas. Baixe o ppd (`directly download PPD`),
e passe-o para o CUPS. Depois disso a impressora deve estar instalado, peça a
impresão de uma página teste e verifique.

Infelizmente as informações são meio dispersas e não cobrem todos os problemas,
principalmente porque eu não sei diferenciar o que é problema e o que deveria de
fato acontecer.

Note que eu não usei o IP da impressora, que **deve** ser uma possibilidade.
