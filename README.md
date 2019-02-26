# Classificador de e-mails

Esta tarefa consiste em encontrar e classificar e-mails recebidos numa string de
entrada. O programa deverá obrigatoriamente ser feito usando lex/flex (se
precisar, modifique o Makefile adequadamente). O programa deverá encontrar três
categorias de elementos:

1. E-mails válidos
1. E-mails válidos de domínios unicamp.br
1. E-mails válidos de domínios fee.unicamp.br

Após, deverá escrever na tela o número de e-mails válidos encontrados em cada
uma das categorias. Note que um e-mail válido no domínio fee.unicamp.br também é
um e-mail válido de domínio unicamp.br e também um e-mail válido (veja as
entradas e saídas dos testes para maiores esclarecimentos).


## Exemplos

Entrada | Saida
------- | -----
`email@email.com email@unicamp.br` | `2 1 0`
`email@fee.unicamp.br email@gmail.com` | `2 1 1`


## Instruções adicionais

1. Vá diretamente ao conjunto de testes para verificar como tratar casos
   limítrofes ou mal-definidos.
1. Lembre-se de seguir as [instruções de submissão](docs/instrucoes.md).
1. Se desejar, proponha novos casos de teste.
