---
layout:     post
title:      Mudando de HD
date:       2014-12-19
categories: public-utility
name:       mudando-de-hd
---
Ontem eu acabei de montar um computador novo.
Esse computador é um upgrade do meu, e o meu passaria para a Kally.
No entanto, eu não gostaria de perder a minha instalação dor Arch,
nem de ficar com o HD antigo, então decidi tentar copiar as partições.

**Nota: Não sei a aplicabilidade destes comandos para outras distribuições.**

**Nota: Você também poderia fazer o que fiz, usando o `dd`, mas eu preferi
evitar.**

Inicialmente, prepare um pendrive (ou sua mídia favorita)
com o iso do Archlinux.
Talvez esses passos possam ser feitos direto da instalação do HD velho,
mas eu preferi não testar.

Faça o boot pelo pendrive.
Verifique que os dois HDs foram identificados e
**atente-se com a numeração sdx do HD**. No meu, o principal era sda, mas quando
eu instalei o outro HD, o novo ficou como sda e o antigo mudou para sdb.
Primeiro particione o HD novo. Eu separei as mesmas partições que o HD antigo,
mas a numeração não foi a mesma, nem o tamanho.
Eu costumo usar 3 partições `/`, `/boot` e `/home`.
Então, depois de particionar o HD novo com a quantidade de partições necessárias
para essas partições, com espaço suficiente para os dados que haviam nas
partições antigas, eu formatei cada partição com o tipo de dado necessário
(usando o `mkfs.ext4`).
Além disso, eu também tinha um swap e queria uma partição compartilhada entre
Windows e Linux, então também "formatei" o swap (`mkswap`) e essa partição
(`mkfs.ntfs`).
Depois disso, eu montei o `/` de cada partição e copiei os dados de uma partição
para outra, com o comando

    cp -a /mnt/velho/. /mnt/novo/

Depois montei o `/home` e `/boot` e copiei o counteúdo de cada um.

    cp -a /mnt/velho/home/. /mnt/novo/home/
    cp -a /mnt/velho/boot/. /mnt/novo/boot/

*Nota: (Imagino que seja possível montar tudo, e depois copiar tudo apenas com o
primeiro comando)*.

Nesse momento, o HD já tem os dados do sistema novo. Então, eu segui,
seletivamente, os passos do [guia do
iniciante](https://wiki.archlinux.org/index.php/beginners%27_guide#Generate_an_fstab)
do Archlinux, a partir do "Generate an fstab". Lembre-se de ligar o swap e
montar a partição ntfs, se quiser que eles sejam preparados no boot.
O comando é

    # genfstab -U -p /mnt/novo > /mnt/novo/etc/fstab

Daí, entrei no sistema novo, com

    # arch-chroot /mnt/novo /bin/bash

e pulei para "Create an initial ramdisk environment".
Não sei se era necessário fazer isso,
mas me parecia uma boa coisa a se fazer.

    # mkinitcpio -p linux

Enfim, atualizei o `/boot/syslinux/syslinux.cfg` para refletir a nova posição do
`\`, e rodei

    # syslinux-install_update -i -a -m

Depois, só sair, desmontar e rebootar

    # exit
    # umount -R /mnt/novo /mnt/velho
    # reboot

Já escrevi isso do computador novo.
