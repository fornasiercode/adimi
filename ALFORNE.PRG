//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier,Alexandre Simas                      //
// ALFORNE.PRG                                                              //
// OBJETIVO:Fazer a alteraá∆o de fornecedores no Banco de Dados             //
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
store 0 to codfornece
//////////////////////////////////////////////////////////////////////////////
sele 1
use fornece.dbf 
sele 2
use material.dbf
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.
sele 1
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

if codfornece=0
set intensity on

declare vet3[1],v3[1]
vet3[1]="raz_social"
v3[1]="Raz∆o Social"
@ 03,05 to 15,74
dbedit (04,06,14,73,vet3,,"",v3,chr(196),chr(179),)
set intensity off

restore screen from tforne
@ 04,21 say codigo
@ 05,21 get raz_social pict "@!"
@ 06,21 get endereco pict "@!"
@ 07,21 get cidade pict "@!"
@ 08,21 get bairro pict "@!"
@ 09,21 get cep pict "99-999,999"
@ 10,21 get telefone pict  "(99)999-99-99"
@ 11,21 get cnpj pict "999999999-99-9999"
@ 12,21 get ins_estad pict "999999/999"
@ 13,21 get contato pict "@!"
read
db=space(30)
sele 2
set intensity on
declare b1[1],b2[1]
b1[1]="produto"
b2[1]="Material Fornecido"
alt=codigo
set filter to codigo=alt
dbedit (04,06,14,73,b1,,"",b2,chr(196),chr(179),)

setcolor("/n")
@ 05,09 clear to 08,73
setcolor( "n*/w,w+/b" )
set intensity off
@ 04,06 clear to 07,72
@ 04,06 to 07,72

@ 05,31 say "ALTERAÄ«O DE MATERIAL"
@ 06,07 say "Nome.do.MATERIAL...:"
set intensity off
@ 06,28 get produto pict "@!"
read
set intensity off
restore screen from tforne
loop
endif
                      

locate for codigo=codfornece

if found()

@ 05,21 get raz_social pict "@!"
@ 06,21 get endereco pict "@!"
@ 07,21 get cidade pict "@!"
@ 08,21 get bairro pict "@!"
@ 09,21 get cep pict "99-999,999"
@ 10,21 get telefone pict  "(99)999-99-99"
@ 11,21 get cnpj pict "999999999-99-9999"
@ 12,21 get ins_estad pict "999999/999"
@ 13,21 get contato pict "@!"
read
db=space(30)
sele 2
set intensity on
declare b1[1],b2[1]
b1[1]="produto"
b2[1]="Material Fornecido"
alt=codigo
set filter to codigo=alt
dbedit (04,06,14,73,b1,,"",b2,chr(196),chr(179),)

setcolor("/n")
@ 05,09 clear to 08,73
setcolor( "n*/w,w+/b" )
set intensity off
@ 04,06 clear to 07,72
@ 04,06 to 07,72

@ 05,31 say "ALTERAÄ«O DE MATERIAL"
@ 06,07 say "Nome.do.MATERIAL...:"
set intensity off
@ 06,28 get produto pict "@!"
read
set intensity off
restore screen from tforne
else
store 0 to codfornece
alert ("Registro n∆o encontrado !")
loop
endif

           a=alert ("Continuar alterando ?",{"Sim","N∆o"})

           if a=1
           @ 04,21 clear to 14,73
           codfornece=0
           loop
           endif

           if a=2
           set intensity on

           @ 04,21 clear to 14,73
           close databases
           return
           endif


enddo
