//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier,Alexandre Simas                      //
// CONFORNE.PRG                                                             //
// OBJETIVO:Fazer a consulta de fornecedores no Banco de Dados              //
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
set intensity off
mater=space(30)
codc=0

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

declare vet3[1],v3[1],vet4[1],v4[1]
vet3[1]="raz_social"
vet4[1]="produto"

v3[1]="Raz∆o Social"
v4[1]="Material Fornecido"
@ 03,05 to 15,74
dbedit (04,06,14,73,vet3,,"",v3,chr(196),chr(179),)
set intensity off

restore screen from tforne
@ 04,21 clear to 04,70
@ 04,21 say codigo
@ 05,21 say raz_social pict "@!"
@ 06,21 say endereco pict "@!"
@ 07,21 say cidade pict "@!"
@ 08,21 say bairro pict "@!"
@ 09,21 say cep pict "99-999,999"
@ 10,21 say telefone pict  "(99)999-99-99"
@ 11,21 say cnpj pict "999999999-99-9999"
@ 12,21 say ins_estad pict "999999/999"
@ 13,21 say contato pict "@!"
@ 14,21 say "Para ver o material fornecido precione uma <TECLA>"
wait""
///////////////////
codc=codigo
sele 2
set filter to codigo=codc
@ 03,05 to 15,74
dbedit (04,06,14,73,vet4,,"",v4,chr(196),chr(179),)

if lastkey()=27
mater=space(30)
setcolor("/n")
@ 05,09 clear to 08,72
setcolor( "n*/w,w+/b" )
set intensity off
@ 04,08 clear to 07,71
@ 04,08 to 07,71
@ 05,31 say "CONSULTA DE MATERIAL"
@ 06,10 say "Nome.do.MATERIAL...:"
@ 06,33 get mater pict "@!"
read
go top
locate for produto=mater
//////////////////////////////////////
if found()
set intensity on
dbedit (04,06,14,73,vet4,,"",v4,chr(196),chr(179),)
set intensity off
codfornece=0
else
codfornece=0
go top
alert ("Registro n∆o EXISTE !!!")
endif
restore screen from tforne
set intensity off

endif
////////////////////////////////////////
restore screen from tforne
loop
endif

locate for codigo=codfornece


if found()
declare vet4[1],v4[1]
vet4[1]="produto"
v4[1]="Material Fornecido"
@ 04,21 clear to 04,70
@ 04,21 say codigo
@ 05,21 say raz_social pict "@!"
@ 06,21 say endereco pict "@!"
@ 07,21 say cidade pict "@!"
@ 08,21 say bairro pict "@!"
@ 09,21 say cep pict "99-999,999"
@ 10,21 say telefone pict  "(99)999-99-99"
@ 11,21 say cnpj pict "999999999-99-9999"
@ 12,21 say ins_estad pict "999999/999"
@ 13,21 say contato pict "@!"
@ 14,21 say "Para ver o material fornecido precione uma <TECLA>"
wait""
///////////////////
codc=codigo
codc=codigo
sele 2
set filter to codigo=codc
@ 03,05 to 15,74
dbedit (04,06,14,73,vet4,,"",v4,chr(196),chr(179),)

if lastkey()=27
mater=space(30)
setcolor("/n")
@ 05,09 clear to 08,72
setcolor( "n*/w,w+/b" )
set intensity off
@ 04,08 clear to 07,71
@ 04,08 to 07,71
@ 05,31 say "CONSULTA DE MATERIAL"
@ 06,10 say "Nome.do.MATERIAL...:"
@ 06,33 get mater pict "@!"
read
go top
locate for produto=mater
//////////////////////////////////////
if found()
set intensity on
dbedit (04,06,14,73,vet4,,"",v4,chr(196),chr(179),)
set intensity off
codfornece=0
else
go top
alert ("Registro n∆o EXISTE !!!")
codfornece=0
endif
restore screen from tforne
set intensity off
loop
endif
else
alert("Registro n∆o encontrado")
codfornece=0
loop
endif
restore screen from tforne
set intensity off

           a=alert ("Continuar consultando ?",{"Sim","N∆o"})

           if a=1
           @ 04,21 clear to 14,73
           codfornece=0
           loop
           endif

           if a=2
           set intensity on
           mater=space(30)
           codc=0
           @ 04,21 clear to 14,73
           close databases
           return
           endif


enddo


