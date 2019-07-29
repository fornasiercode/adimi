//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier,Alexandre Simas,Elio Fontana         //
// EXESTOQ.PRG                                                              //
// OBJETIVO:Fazer a exclusao do estoque no Banco de Dados                   //
//////////////////////////////////////////////////////////////////////////////
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set bell on
set delimiters on
set delimiters to "[]"
set intensity off
//////////////////////////////////////////////////////////////////////////////

////VARIAVEIS/////////////////////////////////////////////////////////////////
store space(40) to nomeprod
store 0 to codprod,quant,estoqmin,precc,preuv,codforn,preuc
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


locate for codigo=codprod
//

if found()
@ 08,21 say produto pict "@!"
@ 09,21 say quantidade pict "99999"
@ 10,21 say estoq_min pict "99999"
@ 11,21 say preccusto pict "9999.99"
@ 12,21 say precucusto pict "9999.99"
@ 13,21 say precuvenda pict "9999.99"
@ 14,21 say mar_lucro pict "9999.99"
wait""
else
alert ("Registro nao encontrado")
store 0 to codprod
loop
endif

      x=alert("Tem certeza que deseja excluir o registro",{"Sim","Nao"})
                if x=1
                nomeprod=produto
                quant=quantidade
                estoqmin=estoq_min
                precc=preccusto
                precu=precucusto
                preuv=precuvenda

                store space(40) to nomeprod
                store 0 to codprod,quant,estoqmin,precc,preuv,codforn,preuc

                replace  produto with  nomeprod
                replace  quantidade with  quant
                replace  estoq_min with  estoqmin
                replace  preccusto with  precc
                replace  precucusto with preuc 
                replace  precuvenda with preuv
                commit
                @ 07,21 clear to 14,73
                store 0 to codprod
                loop
                endif

                if x=2
                store 0 to codprod
                loop
                endif


                     a=alert("Continuar Excluindo",{"Sim","NÆo"})
                         if a=1
                         store 0 to codprod
                         @ 07,21 clear to 14,73
                         loop
                         endif

                         if a=2
                         set intensity on

                         store 0 to codprod
                         @ 07,21 clear to 14,73
                         close databases
                         return
                         endif
  
   


enddo

close databases
return
