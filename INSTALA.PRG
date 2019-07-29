/////////////PROGRAMA DE INSTALACAO

#include "inkey.ch"


set colo to w+/b+,gr+/b
set century on
set date british
for i=0 to 24
@ i,00 say repl ("°",80) 
next

///SOMBRA
set color to /p
@ 02,06 clear to 05,75
@ 08,13 clear to 19,68
///JENELAS
set colo to w+/b+,gr+/b
@ 01,05 clear to 04,74
@ 01,05  to 04,74 double
//
@ 07,12 clear to 18,67
@ 07,12  to 18,67 double
//
@ 02,07 say "ADIMI-2000"
@ 03,07 say "PROGRAMA DE INSTALA€ÇO"
@ 02,63 say date()
@ 03,65 say time()
//
set colo to gr+/b+,gr+/b
@ 08,28 say "Bem vindo ao ADIMI-2000"

@ 10,14 say "  O ADIMI-2000  foi feito para atender   as nesse  -"
@ 11,14 say "cidades do mercado lojista. O programa  tres  bancos"
@ 12,14 say "de dados (funcionarios,fornecedores,estoque), e tam-"
@ 13,14 say "bem avan‡ados recurssos de vendas e faturamento.    "
@ 14,14 say "  Para instalar este avan‡ado recursso para sua loja"
@ 15,14 say "precione <ENTER> e para sair precione <ESC>.        "

set colo to gr+*/b+,gr+/b
@ 17,14 say "<Precione alguma tecla especificada>"

if  lastkey()==K_ENTER
clear
//do install
endif

if lastkey()==K_ESC
clear
endif


inkey(00)

