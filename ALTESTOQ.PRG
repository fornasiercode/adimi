//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier,Alexandre Simas,Elio Fontana         //
// ALTESTOQ.PRG                                                             //
// OBJETIVO:Fazer a alteracao do estoque no Banco de Dados                  //
//////////////////////////////////////////////////////////////////////////////
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set delimiters on
set delimiters to "[]"
set intensity off
//////////////////////////////////////////////////////////////////////////////

////VARIAVEIS/////////////////////////////////////////////////////////////////
store 0 to codprod
//////////////////////////////////////////////////////////////////////////////
sele 1
use estoque.dbf 
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.

@ 07,21 get codprod
read

if lastkey()=27

x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        set intensity on

        @ 07,21 clear to 14,73
        store 0 to codprod    
        close databases
        return
        endif

        if x=2
        loop
        endif
endif

if codprod=0
set intensity on

declare vet2[1],v2[1]
vet2[1]="produto"
v2[1]="Nome do Produto"

@ 06,05 to 15,74 
dbedit (07,06,14,73,vet2,,"",v2,chr(196),chr(179),)
set intensity off

if lastkey()=27
set intensity off
restore screen from testoq
loop
endif

quan=0
precn=0
totp=0
pre=0
restore screen from testoq
@ 07,21 say codigo
@ 08,21 get produto pict "@!"
@ 09,21 get quan pict "99999"
read

@ 09,31 say "Quant.Atual.....:"

total=quantidade+quan
@ 09,49 say total pict "99999"

@ 10,21 get estoq_min pict "99999"
@ 11,21 get precn pict "9999.99"
read
a=precucusto*quantidade
@ 11,31 say "Custo.Atual.....:"
totp=precn+a
@ 11,49 say totp pict "9999.99"

pre=totp/total
@ 12,21 say pre pict "9999.99"
@ 13,21 get precuvenda pict "9999.99"
read
mar_lucro=precuvenda-pre
@ 14,21 say mar_lucro pict "9999.99"
wait""
replace quantidade with total
replace preccusto with totp
replace precucusto with pre
restore screen from testoq
loop
endif


locate for codigo=codprod
//

if found()
quan=0
precn=0
totp=0
pre=0
restore screen from testoq
@ 07,21 say codigo
@ 08,21 get produto pict "@!"
@ 09,21 get quan pict "99999"
read

@ 09,31 say "Quant.Atual.....:"

total=quantidade+quan
@ 09,49 say total pict "99999"

@ 10,21 get estoq_min pict "99999"
@ 11,21 get precn pict "9999.99"
read
a=precucusto*quantidade
@ 11,31 say "Custo.Atual.....:"
totp=precn+a
@ 11,49 say totp pict "9999.99"

pre=totp/total
@ 12,21 say pre pict "9999.99"
@ 13,21 get precuvenda pict "9999.99"
read
mar_lucro=precuvenda-pre
@ 14,21 say mar_lucro pict "9999.99"
wait""
replace quantidade with total
replace preccusto with totp
replace precucusto with pre
restore screen from testoq

else
alert ("Registro nao encontrado")
store 0 to codprod
loop
endif




                     a=alert("Continuar Alterando",{"Sim","NÆo"})
                         if a=1
                         @ 07,21 clear to 14,73
                         store 0 to codprod
                         loop
                         endif

                         if a=2
                         set intensity on
                         
                         @ 07,21 clear to 14,73
                         store 0 to codprod
                         close databases
                         return
                         endif
enddo

close databases
return
