desktop()
setcolor("/n")
clear

#include "inkey.ch"
#include "visual2.ch"

setcancel(.f.)
setcolor( "n*/w,w+/b" )
set key K_F1 to bk

@ 10,10 clear to 14,69
@ 10,10 to 14,69

@ 11,25 say "Vereficando arquivos em DISCO !!!"
for i=1 to 58
setcolor("b/b")
@ 13,i+10 say "€"
inkey(0.01)
if .not. file("estoque.dbf")
alert("O arquivo estoque.dbf n∆o existe")
endif

if .not. file("fornece.dbf")
alert("O arquivo fornece.dbf n∆o existe")
endif

if .not. file("func.dbf")
alert("O arquivo func.dbf n∆o existe")
endif


if .not. file("prazo.dbf")
alert("O arquivo prazo.dbf n∆o existe")
endif


if .not. file("cliente.dbf")
alert("O arquivo cliente.dbf n∆o existe")
endif

if .not. file("vista.dbf")
alert("O arquivo vista.dbf n∆o existe")
endif

if .not. file("material.dbf")
alert("O arquivo material.dbf n∆o existe")
endif

if .not. file("vendas.dbf")
alert("O arquivo vendas.dbf n∆o existe")
endif
next



setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80
setcolor("/n")

@ 10,10 clear to 14,69
@ 10,10 to 14,69

setcolor( "n*/w,w+/b" )
@ 24,00 clear to 24,80
@ 24,02 say "* Pressione <ENTER> para entrar no ADIMI | <ESC> para zerar bancos de dados !"
@ 00,02 say "*  ARQUIVOS DE DADOS VERIFICADOS COM SUCESSO !!!!!"

wait""

if lastkey()=27
@ 10,10 clear to 14,69
@ 10,10 to 14,69
@ 11,25 say "Zerando os BANCOS DE DADOS !!!"

for i=1 to 58
setcolor("b/b")
@ 13,i+10 say "€"
inkey(0.01)

use material.dbf
zap
use

use func.dbf
zap
use

use cliente
zap
use

use estoque
zap
use

use fornece
zap
use

use prazo
zap
use

use vista
zap
use

use vendas
zap
use
next
setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80
@ 00,02 say "* BANCOS DE DADOS zerados !!!!"

setcolor("/n")

@ 10,10 clear to 14,69
@ 10,10 to 14,69
inkey(00)
endif

do adimi

procedure bk
set intensity on
set wrap on
setcolor( "n*/w,w+/b" )
private op:=1
@ 05,20 clear to 15,59
@ 05,20 to 15,33
@ 05,20 to 15,59

@ 05,21 say "* Assitente a Backup !!!"
@ 06,21 prompt " Backup C: "
@ 08,21 prompt " Continua  "
menu to op
do case
case op=1
copy_c()

case op=2
setcolor("/n")
@ 05,20 clear to 15,59

endcase
return



procedure copy_c
private temp:=space(30),temp2:=space(30),i:=0,a:=0
temp=savescreen(00,00,24,80)

@ 06,34 say "Criando Diretorio !!!"
for i=1 to 20
setcolor("b/b")
@ 07,i+34 say "€"
inkey(0.01)
next 
setcolor( "n*/w,w+/b" )

@ 09,34 say "Copiando Arquivos !!!"
for a=1 to 20
setcolor("b/b")
@ 10,a+34 say "€"
inkey(0.01)
next 
setcolor( "n*/w,w+/b" )

temp2=savescreen(00,00,24,80)

run @cls
restscreen(00,00,24,80,temp)
run @md bkadimi
restscreen(00,00,24,80,temp)
run @copy *.dbf bkadimi
restscreen(00,00,24,80,temp2)
@ 13,34 say "Espaáo Livre em disco:"
@ 14,34 say diskspace()
wait""
setcolor("/n")
@ 05,20 clear to 15,59
return



