//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// ALFUNC.PRG                                                               //
// OBJETIVO:Fazer a consulta de funcionarios no Banco de Dados              //
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

codfunc=0

//////////////////////////////////////////////////////////////////////////////
sele 1
use func.dbf 
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.
@ 03,21 get codfunc
read

    if lastkey()=27
    x=alert ("Abortar Operaá∆o",{"Sim","N∆o"})
        if x=1
        set intensity on

        @ 03,21 clear to 16,45
        @ 04,21 clear to 04,73
        @ 05,52 clear to 05,73
        @ 06,59 clear to 06,73
        @ 14,55 clear to 14,73
        @ 15,51 clear to 15,73

        close databases
        return
        endif

                         
        if x=2
        loop
        endif
    endif
if codfunc=0
set intensity on
declare vet[1],v[1]
vet[1]="Nome"
v[1]="Nome do Funcionario"

@ 02,05 to 17,74 
dbedit (03,06,16,73,vet,,"",v,chr(196),chr(179),)
if lastkey()=27
restore screen from tfunci
set intensity off
loop
endif
set intensity off

restore screen from tfunci
@ 03,21 say codigo
@ 04,21 get nome pict "@!"
@ 05,21 get pai pict "@!"
@ 05,52 get mae pict "@!"
@ 06,21 get nascimento
@ 06,59 get filhos pict "99"
@ 07,21 get telefone pict  "(99)999-99-99"
@ 08,21 get civil pict "@!"
@ 09,21 get identidade pict "999999999999"
@ 10,21 get cpf pict "999,999,999-99"
@ 11,21 get cnt pict "99999999"
@ 12,21 get militar pict "99999999"
@ 13,21 get eleitor pict "999999999/99"
@ 14,21 get endereco pict "@!"
@ 14,55 get bairro pict "@!"
@ 15,21 get cidade pict "@!"
@ 15,51 get uf pict "@!"
@ 16,21 get cep pict "99,999,999"
read
restore screen from tfunci
loop

if lastkey()=27
set intensity off
restore screen from tfunci
loop
endif

endif
                      

locate for codigo=codfunc

if found()
@ 04,21 get nome pict "@!"
@ 05,21 get pai pict "@!"
@ 05,52 get mae pict "@!"
@ 06,21 get nascimento
@ 06,59 get filhos pict "99"
@ 07,21 get telefone pict  "(99)999-99-99"
@ 08,21 get civil pict "@!"
@ 09,21 get identidade pict "999999999999"
@ 10,21 get cpf pict "999,999,999-99"
@ 11,21 get cnt pict "99999999"
@ 12,21 get militar pict "99999999"
@ 13,21 get eleitor pict "999999999/99"
@ 14,21 get endereco pict "@!"
@ 14,55 get bairro pict "@!"
@ 15,21 get cidade pict "@!"
@ 15,51 get uf pict "@!"
@ 16,21 get cep pict "99,999,999"
read
else    
codfunc=0
alert ("Registro n∆o encontrado !")
loop
endif


           a=alert ("Continuar Alterando ?",{"Sim","N∆o"})
           if a=1
           @ 03,21 clear to 16,45
           @ 04,21 clear to 04,73
           @ 05,52 clear to 05,73
           @ 06,59 clear to 06,73
           @ 14,55 clear to 14,73
           @ 15,51 clear to 15,73
           codfunc=0
           loop
           endif

           if a=2
           set intensity on
       
           @ 03,21 clear to 16,45
           @ 04,21 clear to 04,73
           @ 05,52 clear to 05,73
           @ 06,59 clear to 06,73
           @ 14,55 clear to 14,73
           @ 15,51 clear to 15,73
           close databases
           return
           endif

enddo
