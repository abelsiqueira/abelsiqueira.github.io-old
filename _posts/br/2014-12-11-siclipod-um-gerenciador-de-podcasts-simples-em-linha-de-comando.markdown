---
layout:     post
title:      SiCLIPoD - Um Gerenciador de Podcasts Simples em Linha de Comando
date:       2014-12-11
categories: fun
name:       siclipod
---
Há algum tempo eu, esporadicamente, eu escuto o podcast do [Jovem
Nerd](http://jovemnerd.com.br/categoria/nerdcast/).
Mas acessar o site é chato, então eu fui procurar um gerenciador de podcasts.
Não gostei de nenhum (o [gpodder](http://gpodder.org/) quase foi escolhido).
Daí, resolvi cria um no estilo que eu gosto.
Falta MUITO pra ficar bom mas pode ser de alguma utilidade para alguém.
O código está no [GitHub](https://github.com/abelsiqueira/siclipod).
O básico pra funcionar é

    siclipod add URL
    siclipod list
    siclipod list NAME
    siclipod search NAME STUFF
    siclipod download NAME STUFF
    siclipod play NAME STUFF

O normal é tocar com o `smplayer`,
mas você pode editar `$HOME/.siclipod/.config` para colocar o que quiser.
Nem o README eu completei ainda.
