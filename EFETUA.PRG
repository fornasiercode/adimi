//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// INFUNC.PRG                                                               //
// OBJETIVO:Efetuar as vendas                                               //
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
store space(40) to vcliente,vendereco,pag
store space(01) to forma
store 0 to codvenda,qtvend,total,codpr,a,b,preco,total,teste,teste2,val
datavenda=ctod(space(08))
apaga=space(10)
declare vet[2000],vet2[2000]
//////////////////////////////////////////////////////////////////////////////

////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.
sele 1
use vendas.dbf

go bottom

codvenda=codigo + 1

@ 03,21 say codvenda pict "999"
datavenda=date()
@ 03,45 say datavenda

@ 04,21 get vcliente pict "@!"
@ 05,21 get vendereco pict "@!"
@ 06,21 get forma pict "@!"
read
sele 8
use prazo.dbf
locate for cliente=vcliente

if found() .and. forma="P"
alert("Este cliente j  deve para a loja !!!")
store space(40) to vcliente,vendereco
store space(01) to forma
store 0 to codvenda,qtvend,total,codpr,a,b,preco,total,teste,teste2,val
datavenda=ctod(space(08))
loop
endif


if lastkey()=27
x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        set intensity on

        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]

        close databases
        return
        endif

        if x=2
        loop
        endif
endif

if forma="A"
do avista
endif

if forma="P"
save screen to pag
set intensity on
form=1
paga=0
setcolor("/n")
@ 06,26 clear to 10,36
setcolor( "n*/w,w+/b" )
@ 05,25 clear to 09,35
@ 05,25 to 09,35
@ 06,26 prompt "30 dias"
@ 07,26 prompt "60 dias"
@ 08,26 prompt "90 dias"
menu to form
if form=1
paga=30
endif
if form=2
paga=60
endif
if form=3
paga=90
endif
restore screen from pag
set intensity off
if paga=30
@ 06,30 say "30 dias"
endif
if paga=60
@ 06,30 say "60 dias"
endif
if paga=90
@ 06,30 say "90 dias"
endif
do prazo
endif


enddo


////////COMPRAS A VISTA

procedure avista

do while .t.
set intensity off
sele 2
use estoque.dbf

@ 07,21 get codpr pict "9999"
read
temp=space(30)
save screen to temp

if lastkey()=27
x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        set intensity off

        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]
        close databases
        return
        endif

        if x=2
        loop
        endif
endif

if empty(codpr)
set intensity on

declare vet4[1],v4[1]
vet4[1]="produto"
v4[1]="Produto"
@ 02,05 to 17,74
dbedit (03,06,16,73,vet4,,"",v4,chr(196),chr(179),)
set intensity off
restore screen from temp
codpr=codigo
loop
endif

@ 07,45 get qtvend pict "9999"
read


if lastkey()=27
x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        set intensity off
        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]
        close databases
        return
        endif

        if x=2
        loop
        endif
endif


locate for codigo=codpr
a=a+1

if a=8
@ 09,48 clear to 16,54
@ 09,07 clear to 16,46
@ 09,56 clear to 16,72
a=1
endif

if found()
teste=quantidade-estoq_min
if qtvend > teste
x=alert("Quantidade maior que o estoque minimo !!!",{"Abortar"})

        if x=1
        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]
        close databases
        return
        endif

endif
teste2=quantidade
teste2=teste2-qtvend
replace quantidade with teste2


preco=qtvend*precuvenda
total=total+preco


@ a+8,07 say produto
@ a+8,56 say precuvenda pict "9999.99"
@ a+8,49 say qtvend pict "9999"
@ 07,63 say total pict "999999.99"

else
alert ("Codigo inexitente")
loop
endif

b=b+1

vet[b]=produto
vet2[b]=precuvenda
wait""

x=alert ("Continuar efetuando a venda",{"Sim","NÆo"})
  if x=1
  loop
  endif
  if x=2
  /////////PREENCHIMENTO DO BANCO DE DADOS

  sele 1
  use vendas.dbf
  append blank
  replace codigo with codvenda
  replace data with datavenda
  replace cliente with vcliente
  replace endereco with vendereco
  commit

  sele 3
  use vista.dbf
  append blank
  replace data_venda with datavenda
  replace cod_venda with codvenda
  replace cliente with vcliente 
  replace valor with total
  replace recebido with total
  commit

  sele 4
  use cliente.dbf
  locate for nome=vcliente
  if eof()
  append blank
  replace nome with vcliente
  replace endereco with vendereco
  commit
  endif
       w=alert ("Deseja imprimir a nota fiscal",{"Sim","NÆo"})
                if w=1
                set device to printer
                @ 02,04 say "ADIMI - 2000               -NOTA FISCAL-"
                @ 03,04 say "CODIGO"
                @ 04,05 say codvenda
                @ 05,05 say "TOTAL:"
                @ 06,06 say total
                @ 07,05 say "PRODUTO"
                @ b+8,05 say vet[b]
                @ 07,50 say "PRECO"
                @ b+8,50 say vet[b]
                @ 40,05 say total
                store space(40) to vcliente,vendereco
                store space(01) to forma
                store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
                datavenda=ctod(space(08))
                declare vet[2000],vet2[2000]
                @ 03,21 clear to 07,29
                @ 04,21 clear to 05,72
                @ 03,46 clear to 05,72
                @ 07,63 say apaga
                @ 07,45 say apaga
                @ 03,45 say apaga

                @ 09,07 clear to 16,46
                @ 09,56 clear to 16,72
                @ 09,48 clear to 16,54

                exit
                close databases
                return
                endif


                if w=2
                store space(40) to vcliente,vendereco
                store space(01) to forma
                store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
                datavenda=ctod(space(08))
                declare vet[2000],vet2[2000]
                @ 03,21 clear to 07,29
                @ 04,21 clear to 05,72
                @ 03,46 clear to 05,72
                @ 07,63 say apaga
                @ 07,45 say apaga
                @ 03,45 say apaga

                @ 09,07 clear to 16,46
                @ 09,56 clear to 16,72
                @ 09,48 clear to 16,54

                exit
                close databases
                
                return
                endif

   endif

enddo
return
/////////////////////


////////// COMPRAS A PRAZO
procedure prazo
set intensity off
do while .t.
sele 2
use estoque.dbf

@ 07,21 get codpr pict "9999"
read
temp2=space(30)
save screen to temp2

if lastkey()=27
x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        set intensity off
        restore screen from vendt
        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]
        close databases
        return
        endif

        if x=2
        loop
        endif
endif
if empty(codpr)
set intensity on
            
declare vet4[1],v4[1]
vet4[1]="produto"
v4[1]="Produto"
@ 02,05 to 17,74 
dbedit (03,06,16,73,vet4,,"",v4,chr(196),chr(179),)
set intensity off

restore screen from temp2
codpr=codigo
loop
endif


@ 07,45 get qtvend pict "9999"
read

if lastkey()=27
x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        restore screen from vendt

        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]
        close databases
        return
        endif

        if x=2
        loop
        endif
endif

locate for codigo=codpr
a=a+1

if a=8
@ 09,07 clear to 16,46
@ 09,56 clear to 16,72
@ 09,48 clear to 16,54
a=1
endif

if found()
teste=quantidade-estoq_min

if qtvend > teste
x=alert ("Quantidade maior que o estoque minimo !!!",{"Abortar"})

        if x=1
        restore screen from vendt

        @ 03,21 clear to 07,29
        @ 04,21 clear to 05,72
        @ 03,46 clear to 05,72
        @ 07,63 say apaga
        @ 07,45 say apaga
        @ 03,45 say apaga

        @ 09,07 clear to 16,46
        @ 09,56 clear to 16,72
        @ 09,48 clear to 16,54

        store space(40) to vcliente,vendereco
        store space(01) to forma
        store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
        datavenda=ctod(space(08))
        declare vet[2000],vet2[2000]
        close databases
        return
        endif

endif
teste2=quantidade
teste2=teste2-qtvend
replace quantidade with teste2



preco=qtvend*precuvenda
total=total+preco


@ a+8,07 say produto
@ a+8,56 say precuvenda pict "9999.99"
@ a+8,49 say qtvend pict "9999"
@ 07,63 say total pict "999999.99"
else
alert ("Codigo inexitente")
loop
endif

b=b+1

vet[b]=produto
vet2[b]=precuvenda
wait""

x=alert ("Continuar efetuando a venda",{"Sim","NÆo"})
  if x=1
  loop
  endif
  if x=2
  /////////PREENCHIMENTO DO BANCO DE DADOS
  sele 1
  use vendas.dbf
  append blank
  replace codigo with codvenda
  replace data with datavenda
  replace cliente with vcliente
  replace endereco with vendereco
  replace formapaga with paga
  commit

  sele 8
  use prazo.dbf
  append blank
  replace data_venda with datavenda
  replace cod_venda with codvenda
  replace cliente with vcliente 
  replace valor with total
  commit

  sele 4
  use  cliente.dbf
  locate for nome=vcliente
  if eof()
  append blank
  replace nome with vcliente
  replace endereco with vendereco
  commit
  endif

       w=alert ("Deseja imprimir a nota fiscal",{"Sim","NÆo"})
                if w=1
                set device to printer
                @ 02,04 say "ADIMI - 2000               -NOTA FISCAL-"
                @ 03,04 say "CODIGO"
                @ 04,05 say codvenda
                @ 05,05 say "TOTAL:"
                @ 06,06 say total
                @ 07,05 say "PRODUTO"
                @ b+8,05 say vet[b]
                @ 07,50 say "PRECO"
                @ b+8,50 say vet[b]
                @ 40,05 say total
                store space(40) to vcliente,vendereco
                store space(01) to forma
                store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
                datavenda=ctod(space(08))
                declare vet[2000],vet2[2000]
                restore screen from vendt

                @ 03,21 clear to 07,29
                @ 04,21 clear to 05,72
                @ 03,46 clear to 05,72
                @ 07,63 say apaga
                @ 07,45 say apaga
                @ 03,45 say apaga

                @ 09,07 clear to 16,46
                @ 09,48 clear to 16,54
                @ 09,56 clear to 16,72
                exit
                close databases
                return
                endif


                if w=2
                store space(40) to vcliente,vendereco
                store space(01) to forma
                store 0 to codvenda,qtvend,total,codpr,a,b,preco,total
                datavenda=ctod(space(08))
                declare vet[2000],vet2[2000]
                restore screen from vendt
        
                @ 03,21 clear to 07,29
                @ 04,21 clear to 05,72
                @ 03,46 clear to 05,72
                @ 07,63 say apaga
                @ 07,45 say apaga
                @ 03,45 say apaga

                @ 09,48 clear to 16,54
                @ 09,07 clear to 16,46
                @ 09,56 clear to 16,72
                exit
                close databases
                
                return
                endif

   endif

enddo
return
/////////////////////









