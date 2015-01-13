---
layout:     post
title:      Instalando o Ubuntu 14.10 no Sony Vaio (Problemas com o SSD)
date:       2015-01-12
categories: public-utility
name:       ubuntu-sony-vaio
---
Hoje instalei em dual-boot o Ubuntu 14.10 e o windows 8.
Não tive problemas com o UEFI, nem secure boot.
Não tenho certeza, mas talvez o windows não seja o que veio
de fábrica.

Eu já tinha um USB com o Ubuntu 14.10, então pluguei-o
e bootei o computador.
F12-F12-F12-F12... A tela de seleção de boot não apareceu,
mas o usb foi escolhido automaticamente.

O ubuntu bootou e selecionei instalar.
Escolhi o particionamento manual,
que é minha escolha usual.
Normalmente faço o particionamento manual,
porque não gosto quando eles criam (criavam, não sei
se continuam) apenas o `/` e o `swap`.
O windows estava instalado em duas partições num SSD.
Selecionei a correspondente, redimensionei, criei 3 partições lógicas
(`/`, `swap`, e `/home`), e mandei instalar.
A instalação não teve problemas. Aí eu bootei e deu erro.

O primeiro erro que apareceu foi

    tpm_tis: A TPM error (6) occurred attempting to read a pcr value

Que depois descobri que era proveniente do
[Trusted Platform Module](https://wiki.archlinux.org/index.php/TPM).
Depois de pouca busca, descobri que bastava entrar na BIOS e habilitar o
TPM. A saber, para entrar na BIOS no Sony Vaio, desligue o computador e
aperte o botão ASSIST.
Habilitei o TPM, mas não sei o que ele faz na prática. No entanto,
aparentemente, o computador continuou funcionando normalmente.

O segundo erro que apareceu, que já aparecia junto com o primeiro, mas
que só olhei depois, foi algo na linha de

    [ 9.115544] ata9: exception Emask 0x0 SAct 0xf SErr 0x0 action 0x10 frozen
    [ 9.115550] ata9.00: failed command: READ FPDMA QUEUED
    [ 9.115556] ata9.00: cmd 60/04:00:d4:82:85/00:00:1f:00:00/40 tag 0 ncq 2048 in
    [ 9.115557] res 40/00:18:d3:82:85/00:00:1f:00:00/40 Emask 0x4 (timeout)

Após alguma busca descobri ser um erro de Native Command Queueing com SSDs.
A solução
[[1]](http://steffankarger.nl/2013/12/10/ubuntu-13-10-on-the-sony-vaio-pro-13/)
[[2]](http://www.howtoeverything.net/linux/hardware/ubuntu-freeze-issue-after-ssd-upgrade)
[[3]](https://wiki.archlinux.org/index.php/Solid_State_Drives#Resolving_NCQ_Errors)
foi adicionar `libata.force=noncq` na configuração do grub.
Para isso, resumindo a referência, boot no live,
monte o `/` com bind pro `/dev`, `/sys` e `/proc`, e se tiver separado, o `/boot`
também. Os comandos a seguir fazem isso, supondo `/` instalado no `/dev/sda5`.

    $ sudo mount /dev/sda5 /mnt
    $ sudo mount --bind /dev /mnt/dev
    $ sudo mount --bind /sys /mnt/sys
    $ sudo mount --bind /proc /mnt/proc

Daí, entre nesse sistema com

    $ sudo chroot /mnt

No sistema novo, edite o arquivo `/etc/default/grub`, modificando a linha

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

para

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash libata.force=noncq"

e atualize o grub com

    $ sudo update-grub

Saia e desmonte as partições

    $ exit
    $ sudo umount -R /mnt

Por fim é só reiniciar e ver se funcionou.

Agora, a parte divertida dessa instalação, que durou quase 3 horas (!) foi em
algum lugar eu li, ou achei ter lido `libdata` no lugar de `libata`, e pareceu
que essa solução não resolveu. E isso não é o pior, eu cheguei a buscar
`libdata.force=noncq`, o google me corrigiu pra `libata.force=noncq`, e eu
cheguei a ler depois o `libata` e achei que era outra opção.

Mas tirando isso, instalações sem problema.
