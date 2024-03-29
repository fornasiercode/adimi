//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS�O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// VEND.PRG                                                                 //
// OBJETIVO:Levar as varias opera��es com Vendas                            //
//////////////////////////////////////////////////////////////////////////////
clear
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set bell on
set wrap on
set message to 21 center
set color to w+/b+
//////////////////////////////////////////////////////////////////////////////
////VARIAVEIS/////////////////////////////////////////////////////////////////
vend=1
vendt=space(30)
////TELA PRINCIPAL////////////////////////////////////////////////////////////

///FUNDO
setcolor("w/w");@ 01,00 clear to 24,80

///SOMBRA
setcolor(" /n")
@ 21,06 clear to 23,75
@ 03,06 clear to 18,75

///JENELAS
setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80

@ 00,00 clear to 00,80
//
@ 20,05 clear to 22,74
@ 20,05 to 22,74 
//
@ 02,05 clear to 17,74
@ 02,05 to 17,74
//
/////
@ 03,07 say "Cod.Venda...:"  
@ 03,30 say "Data.Venda..:"
@ 04,07 say "Nome.Client.:"
@ 05,07 say "Endere�o....:"
@ 06,07 say "Forma.Paga..:"
@ 07,07 say "Cod.Produto.:"
@ 07,30 say "Quant.......:"
@ 07,56 say "TOTAL:"
// 
@ 08,05 to 17,55
@ 08,05 to 17,47

//
@ 08,05 to 17,74 
//
@ 08,07 say "Nome do Produto"
@ 08,62 say "Pre�o"
@ 08,49 say "Quant"

//////////////////////////////////////////////////////////////////////////////

////MENU DO VEND///////////////////////////////////////////////////////////////
do while .t.
@ 00,02 prompt "Efetuar" message "Efetua Vendas"
@ 00,19 prompt "T/Pre�os" message "Mostra a tabela de pre�os"
@ 00,37 prompt "Clientes" message "Mostra Lista de Clientes"
@ 00,54 prompt "C/Vendas" message "Consulta as vendas feitas"
@ 00,73 prompt "Voltar" message "Volta ao menu principal"
menu to vend
save screen to vendt
do case
case vend=1
do efetua
case vend=2
do preco
case vend=3
do client
case vend=4
do formap
case vend=5
restore screen from tadimi
return

endcase

enddo


procedure preco

declare m[4],m2[4]
m[1]="produto"
m[2]="quantidade"
m[3]="estoq_min"
m[4]="precuvenda"

m2[1]="Produto"
m2[2]="Quantidade"
m2[3]="Estoque minimo"
m2[4]="Pre�o de venda"

sele 1
use estoque.dbf
@ 02,05 to 17,74 
dbedit (03,06,16,73,m,,"",m2,chr(196),chr(179),)
tela=savescreen(03,06,16,73)
////////////
if lastkey()=27
produ=space(30)
setcolor("/n")
@ 05,09 clear to 08,72
setcolor( "n*/w,w+/b" )
set intensity off
@ 04,08 clear to 07,71
@ 04,08 to 07,71
@ 05,31 say "CONSULTA DE PRE�OS"
@ 06,10 say "Nome.do.PRODUTO...:"
@ 06,30 get produ pict "@!"
read
locate for produto=produ
if found()
restscreen(03,06,16,73,tela)
set intensity on
dbedit (03,06,16,73,m,,"",m2,chr(196),chr(179),)
else
set intensity on
alert ("Registro n�o EXISTE !!!")
restscreen(03,06,16,73,tela)
endif
endif
////////////////
restore screen from vendt
close databases
return


procedure client
declare c[2],c2[2]
c[1]="nome"
c[2]="endereco"

c2[1]="Nome do Cliente"
c2[2]="Endere�o"


sele 1
use cliente.dbf
@ 02,05 to 17,74 
dbedit (03,06,16,73,c,,"",c2,chr(196),chr(179),)
nomec=nome
if lastkey()=27
restore screen from vendt
return
endif
sele 2 
use prazo.dbf

locate for nomec=cliente

if found()
@ 03,06 clear to 16,73
@ 02,05 to 17,74 

@ 04,07 say "Contas do cliente:"

@ 08,07 say "Data.Venda.......:"
@ 10,07 say "Cliente..........:"
@ 12,07 say "Total.Conta......:"

@ 14,07 say "Recebido.........:"

databaixa=data_venda
totbaixa=valor
nomebaixa=cliente
baixa=recebido

@ 08,25 say databaixa 
@ 10,25 say nomebaixa pict "@!"
@ 12,25 say totbaixa pict "9999.99"
@ 14,25 say baixa pict "9999.99"
wait""
restore screen from vendt
close databases
else
alert ("Este cliente esta com as contas em dia.")
restore screen from vendt
endif


return




procedure formap
do while .t.
sele 1
use vendas.dbf
mform=1

declare f[5],f2[5]
f[1]="codigo"
f[2]="data"
f[3]="cliente"
f[4]="endereco"
f[5]="formapaga"

f2[1]="Codigo"
f2[2]="Data"
f2[3]="Cliente"
f2[4]="Endereco"
f2[5]="Forma de Pagamento"


@ 02,05 clear to 17,74
@ 02,05 to 17,74
@ 02,05 to 17,16
@ 02,18 say "Consulta de VENDAS:"
@ 03,07 prompt "30 DIAS"
@ 09,07 prompt "60 DIAS"
@ 16,07 prompt "90 DIAS"
menu to mform

if lastkey()=27
restore screen from vendt
exit
return
endif

if mform=1
fa=30
set filter to formapaga=fa
dbedit (03,18,16,73,f,,"",f2,chr(196),chr(179),)
restore screen from vendt
exit

endif
if mform=2
fa=60
set filter to formapaga=fa
dbedit (03,18,16,73,f,,"",f2,chr(196),chr(179),)
restore screen from vendt
exit
endif
if mform=3
fa=90
set filter to formapaga=fa
dbedit (03,18,16,73,f,,"",f2,chr(196),chr(179),)
restore screen from vendt
exit
endif

enddo
return

