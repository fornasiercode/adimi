//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier,Alexandre Simas                      //
// EXFORNE.PRG                                                              //
// OBJETIVO:Fazer a exclus∆o de fornecedores no Banco de Dados              //
//////////////////////////////////////////////////////////////////////////////
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set bell on
set delimiters on
set delimiter to "[]"
set intensity off
//////////////////////////////////////////////////////////////////////////////
////VARIAVEIS/////////////////////////////////////////////////////////////////
store space(40) to forraz,forende,matforne
store space(30) to forcontat,forcida,forbai
store 0 to codfornece,cepforne,teleforne,cnpjforne,instadfor
//////////////////////////////////////////////////////////////////////////////
sele 1
use fornece.dbf 
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.

@ 04,21 get codfornece
read

    if lastkey()=27
    x=alert ("Abortar Operaá∆o",{"Sim","N∆o"})
        if x=1
        set intensity on

        @ 04,21 clear to 14,73
        close databases
        return
        endif


        if x=2
        loop
        endif
    endif
                      

locate for codigo=codfornece

if found()

@ 05,21 say raz_social pict "@!"
@ 06,21 say endereco pict "@!"
@ 07,21 say cidade pict "@!"
@ 08,21 say bairro pict "@!"
@ 09,21 say cep pict "99-999,999"
@ 10,21 say telefone pict  "(99)999-99-99"
@ 11,21 say cnpj pict "999999999-99-9999"
@ 12,21 say ins_estad pict "999999/999"
@ 13,21 say contato pict "@!"
@ 14,21 say mat_fornec pict "@!"
wait""
else
store 0 to codfornece
alert ("Registro n∆o encontrado !")
loop
endif

           a=alert ("Tem serteza que deseja excluir o registro ?",{"Sim","N∆o"})
           if a=1
               forraz=raz_social
               forende=endereco
               forcida=cidade
               forbai=bairro
               cepforne=cep
               teleforne=telefone
               cnpjforne=cnpj
               instadfor=ins_estad
               forcontat=contato
               matforne=mat_fornec

               store space(40) to forraz,forende,matforne
               store space(30) to forcontat,forcida,forbai
               store 0 to codfoenece,cepforne,teleforne,cnpjforne,instadfor


                replace raz_social with forraz  
                replace endereco with forende
                replace cidade with forcida 
                replace bairro with forbai  
                replace cep with cepforne
                replace telefone with teleforne
                replace cnpj with cnpjforne
                replace ins_estad with instadfor
                replace contato with forcontat
                replace mat_fornec with matforne
                commit

           
           @ 04,21 clear to 14,73
           store 0 to codfornece
           endif

           if a=2
           @ 04,21 clear to 14,73
           store 0 to codfornece
           loop
           endif

enddo


