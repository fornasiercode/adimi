//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// INESTOQ.PRG                                                              //
// OBJETIVO:Fazer a inclusÆo do estoque no Banco de Dados                   //
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
store space(40) to nomeprod
store 0 to codprod,quant,estoqmin,precc,preuv,codforn,preuc,margl
//////////////////////////////////////////////////////////////////////////////
sele 1
use estoque.dbf 
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.

go bottom
codprod=codigo+1

@ 07,21 say codprod 

@ 08,21 get nomeprod pict "@!"
@ 09,21 get quant pict "99999"
@ 10,21 get estoqmin pict "99999"
@ 11,21 get precc pict "9999.99"
read
preuc=precc/quant
@ 12,21 say preuc pict "9999.99"
@ 13,21 get preuv pict "9999.99"
read
margl=preuv-preuc
@ 14,21 say margl pict "9999.99"
wait""

sele 2
use material.dbf
locate for produto=nomeprod

if eof()
alert ("Cadatre o FORNECEDOR deste produto no cadastro de fornecedores")
use
sele 1
use estoque.dbf 
endif

sele 1
use estoque.dbf 


if lastkey()=27
x=alert ("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        set intensity on

        @ 07,21 clear to 14,73
        store space(40) to nomeprod
        store 0 to codprod,quant,estoqmin,precc,preuv,codforn,preuc,margl
        close databases
        return
        endif

        if x=2
        loop
        endif
endif

if estoqmin > quant
alert ("O estoque minimo esta maior que a quantidade a ser comprada !")
loop
endif



      x=alert("Confirmar Digita‡Æo",{"Sim","NÆo"})

                if x=1
                append blank
                replace  codigo with  codprod
                replace  produto with  nomeprod
                replace  quantidade with  quant
                replace  estoq_min with  estoqmin
                replace  preccusto with  precc
                replace  precucusto with preuc 
                replace  precuvenda with preuv
                replace  mar_lucro with margl
                commit
                
                     a=alert("Continuar Incluindo",{"Sim","NÆo"})
                         if a=1
                         store space(40) to nomeprod
                         store 0 to codprod,quant,estoqmin,precc,preuv,preuc,margl
                         @ 07,21 clear to 14,73
                         loop
                         endif

                         if a=2
                         set intensity on

                         store space(40) to nomeprod
                         store 0 to codprod,quant,estoqmin,precc,preuv,codforn,preuc,margl
                         @ 07,21 clear to 14,73
                         close databases
                         return
                         endif
  
                endif
   
                if x=2
                loop
                endif


enddo

close databases
return
