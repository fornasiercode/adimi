//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// INFORNE.PRG                                                              //
// OBJETIVO:Fazer a inclus∆o de fornecedores no Banco de Dados              //
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
sele 1
use fornece.dbf 


////VARIAVEIS/////////////////////////////////////////////////////////////////
store space(40) to forraz,forende,matforne
store space(30) to forcontat,forcida,forbai
store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
//////////////////////////////////////////////////////////////////////////////
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.
sele 1

go bottom
codfornece=codigo+1

@ 04,21 say codfornece 
if lastkey()=27
x=alert ("Abortar Operaá∆o",{"Sim","N∆o"})
        if x=1
        set intensity on

        @ 04,21 clear to 14,73
        store space(40) to forraz,forende,matforne
        store space(30) to forcontat,forcida,forbai
        store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
        close databases
        return
        endif


        if x=2
        loop
        endif
endif

@ 05,21 get forraz pict "@!"
@ 06,21 get forende pict "@!"
@ 07,21 get forcida pict "@!"
@ 08,21 get forbai pict "@!"
@ 09,21 get cepforne pict "99-999,999"
@ 10,21 get teleforne pict  "(99)999-99-99"
@ 11,21 get cnpjforne pict "999999999-99-9999"
@ 12,21 get instadfor pict "999999/999"
@ 13,21 get forcontat pict "@!"
read
do mat


if lastkey()=27
x=alert ("Abortar Operaá∆o",{"Sim","N∆o"})
        if x=1
        set intensity on

        @ 04,21 clear to 14,73
        store space(40) to forraz,forende,matforne
        store space(30) to forcontat,forcida,forbai
        store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
        close databases
        return
        endif


        if x=2
        loop
        endif
endif


      x=alert("Confirmar Digitaá∆o",{"Sim","N∆o"})

                if x=1
                sele 1
                /////entrada do banco
                append blank
                replace codigo with codfornece
                replace raz_social with forraz  
                replace endereco with forende
                replace cidade with forcida
                replace bairro with forbai
                replace cep with cepforne
                replace telefone with teleforne
                replace cnpj with cnpjforne
                replace ins_estad with instadfor
                replace contato with forcontat
                commit

                     a=alert("Continuar Incluindo",{"Sim","N∆o"})
                         if a=1
                         store space(40) to forraz,forende,matforne
                         store space(30) to forcontat,forcida,forbai
                         store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
                         @ 04,21 clear to 14,73
                         loop
                         endif

                         if a=2
                         set intensity on

                         store space(40) to forraz,forende,matforne
                         store space(30) to forcontat,forcida,forbai
                         store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
                         close databases
                         @ 04,21 clear to 14,73
                         return
                         endif
  
                endif
   
                if x=2
                loop
                endif


enddo

close databases
return

procedure mat

do while .t.
sele 2
use material.dbf

codm=codfornece
@ 14,21 get matforne pict "@!"
read
if lastkey()=27
x=alert ("Abortar Operaá∆o",{"Sim","N∆o"})
        if x=1
        set intensity on

        @ 04,21 clear to 14,73
        store space(40) to forraz,forende,matforne
        store space(30) to forcontat,forcida,forbai
        store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
        close databases
        return
        endif


        if x=2
        loop
        endif
endif

     sele 2
     append blank
     replace codigo with codm
     replace produto with matforne


x=alert("Mais MATERIAIS",{"SIM","NAO"})
     if x=1
     matforne=space(40)
     loop
     endif

     if x=2
     exit
     endif
enddo

return
