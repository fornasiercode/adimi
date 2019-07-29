******************************************************************************
* - CCD - 2001 -                                                             *
* - CONTAS CORRENTES DIVERSSAS -                                             *
* - L . B . F  SOFTWARE -                                                    *
* - Criado por : Leonardo Brum fornasier                                     *                                         *
* - Analise : Sergio fornasier                                               *
* - LBFCONTA.PRG -                                                           *
******************************************************************************
clear memory

** SET'S
set score off
set date british
set intensity on
set century on
set wrap on
set procedure to procs
**

** VARIAVEIS
menup=2
telap=space(30)
contap=space(30)
categoriap=space(30)
conta=1
categoria=1

** TELA
clear

set color to w+/w+
for i=0 to 24
@ i,00 say repl ("Û",80)
next

*

set color to p/w+,w+/b+
@ 00,00 clear to 00,80
@ 24,00 clear to 24,80
*
@ 24,68 say "C.C.D-2001"
@ 24,02 say "L.B.F - Software"

** ESTRUTURA
do while .t.
@ 00,01 prompt " - "
@ 00,04 prompt " Conta "
@ 00,12 prompt " Relat¢rios "
@ 00,24 prompt " Categorias "
@ 00,36 prompt " Backup "
@ 00,44 prompt " Ajuda "
@ 00,76 prompt " x "
menu to menup
telap=savescreen(00,00,24,80)
do case
case menup=2
conta()
case menup=4
categorias()
case menup=7
saida()
exit
endcase

enddo


* PROCEDURES DE MENU

procedure conta
set color to /p
@ 03,05 clear to 08,26
set color to p/w+,w+/b+

@ 02,04 clear to 07,25
@ 02,04 to 07,25
*
do while .t.
@ 03,05 prompt " Nova Conta         "
@ 04,05 prompt " Lan‡amento         "
@ 05,05 prompt " Saldo Conta        "
@ 06,05 prompt " Excluir Conta      "
menu to conta
contap=savescreen(00,00,24,80)
*
if lastkey()=27
restscreen(00,00,24,80,telap)
exit
endif
*

do case

case conta=1
conta_nova()

case conta=2
lancamento()

case conta=3
saldo()

case conta=4
ex_conta()
endcase

enddo

return


procedure categorias
set color to /p
@ 03,25 clear to 06,46
set color to p/w+,w+/b+

@ 02,24 clear to 05,45
@ 02,24 to 05,45
*
do while .t.
@ 03,25 prompt " Incluir            "
@ 04,25 prompt " Consultar          "
menu to categoria
categoriap=savescreen(00,00,24,80)
*
if lastkey()=27
restscreen(00,00,24,80,telap)
exit
endif
*
do case
case categoria=1
in_categ()
case categoria=2
con_categ()
endcase



enddo


return


