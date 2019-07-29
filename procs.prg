***************************
*  ARQUIVO DE PROCEDURES  *
***************************



* PROCEDURE DE SAIDA
procedure saida
set color to
clear
return
*

* PROCEDURE CONTA-NOVA
procedure conta_nova

*
set procedure to telas
set intensity off
set delimiters on
set delimiters to "[]"
set console off
set confirm off
*
tconta_nova()
*

*
nomeconta=space(30)
cod=0
public arqconta:=(04)
public arqconta2:=(04)
c=0
*

sele 1
use contas.dbf 

*
do while .t.
sele 1
go bottom
cod=codigo+1

@ 11,30 say cod pict "9999"
@ 12,30 get nomeconta pict "@!"
read
locate for nome=nomeconta

if found()
loop
endif
        if empty(nomeconta)
        close databases
        restscreen(00,00,24,80,contap)
        set intensity on
        return
        exit
        endif



arqconta="CONT"+alltrim(str(cod))
arqconta2="CATE"+alltrim(str(cod))

  if isalpha(arqconta)=.f.
  loop
  endif


@ 13,30 say arqconta+".DBF" pict "@!"
@ 14,30 say arqconta2+".DBF" pict "@!"
wait""

* BDD
        append blank
        replace codigo with cod
        replace nome with nomeconta
        replace arquivo with arqconta
        replace indice with arqconta2
cria()
cria2()


restscreen(09,10,15,63,tconta_nova)
nomeconta=space(30)
arqconta=space(08)
cod=0
enddo
return

* PROCEDURE DE CRIAÄ«O DE BANCO DE DADOS - ARQCONTA - 

procedure cria

campo1="DATA"
campo2="CODIGO"
campo3="HISTORICO"
campo4="DEBITO"
campo5="CREDITO"
campo6="SALDO"
campo7="JUROS"
*
tipo1="D"
tipo2="N"
tipo3="C"
tipo4="N"
tipo5="N"
tipo6="N"
tipo7="N"
*
tam1=10
tam2=04
tam3=33
tam4=15
tam5=15    
tam6=15
tam7=05
*
dec1=0
dec2=0
dec3=0
dec4=0
dec4=2
dec5=2
dec6=2
dec7=0
*
sele 2
create temp


append blank
replace field_name with campo1
replace field_type with tipo1
replace field_len with  tam1
replace field_dec with  dec1
*
append blank
replace field_name with campo2
replace field_type with tipo2
replace field_len with  tam2
replace field_dec with  dec2
*
append blank
replace field_name with campo3
replace field_type with tipo3
replace field_len with  tam3
replace field_dec with  dec3
*
append blank
replace field_name with campo4
replace field_type with tipo4
replace field_len with  tam4
replace field_dec with  dec4
*
append blank
replace field_name with campo5
replace field_type with tipo5
replace field_len with  tam5
replace field_dec with  dec5
*
append blank
replace field_name with campo6
replace field_type with tipo6
replace field_len with  tam6
replace field_dec with  dec6
*
append blank
replace field_name with campo7
replace field_type with tipo7
replace field_len with  tam7
replace field_dec with  dec7

create(arqconta) from temp

erase temp
return

* PROCEDURE DE CRIAÄ«O DE BANCO DE DADOS - ARQCONTA2 -
procedure cria2
camp1="CODIGO"
camp2="CATEGORIA"
*
tip1="N"
tip2="C"
*
tm1=04
tm2=20
*
dc1=0
dc2=0
*
sele 3
create temp2


append blank
replace field_name with camp1
replace field_type with tip1
replace field_len with  tm1
replace field_dec with  dc1
*
append blank
replace field_name with camp2
replace field_type with tip2
replace field_len with  tm2
replace field_dec with  dc2
*

create(arqconta2) from temp2

erase temp2


return



* PROCEDURE LANÄAMENTO

procedure lancamento

# include "inkey.ch"

*
set procedure to telas
set intensity off
set delimiters on
set delimiters to "[]"
set console off
set confirm off
set century on
*
tlancamento()
*
sele 1
use contas
*
cod=0
histo=space(33)
cond=space(01)
ocorr=0
tt=0
tt2=0
val=0
dat=ctod(space(08))
deb=0
cred=0
public arq:=(10)
public arq2:=(10)
*
do while .t.
sele 1
@ 05,42 get cod pict "9999"
read
       *******************************
       if lastkey()=27
       cod=0
       histo=space(33)
       cond=space(01)
       ocorr=0
       teste=0
       teste2=0
       val=0
       dat=ctod(space(08))
       deb=0
       cred=0
       *
       close databases
       restscreen(00,00,24,80,contap)
       set intensity on
       return
       exit
       endif
       ********************************
       if empty(cod)
       pcontas()
       loop
       endif

       ********************************

locate for codigo=cod

       if found()
       @ 05,49 say alltrim(nome) 
       arq=alltrim(arquivo)
       arq2=alltrim(indice)
       sele 2
       use(arq)
       sele 3
       use(arq2)
       else
       alert("Esta conta n∆o existe !!!!")
       loop
       endif
       *


 dat=date()

 @ 06,42 say dat
 @ 07,42 get histo pict "@!"
 @ 08,42 get cond pict "@!";
 valid cond="C" .or. cond="D"
 @ 09,42 get val pict "9999.99"
 read

 if cond="C"
 tt=cred+val
 @ 09,55 say tt pict "9999.99"
 endif

 if cond="D"
 tt2=deb-val
 @ 09,55 say tt2  pict "9999.99"
 endif
 read

 *******************************************
 begin sequence
 do while .t.
 @ 10,42 get ocorr pict "999"
 read

 if lastkey()=27
 cod=0
 histo=space(33)
 cond=space(01)
 public ocorr:=0
 teste=0
 teste2=0
 val=0
 dat=ctod(space(08))
 deb=0
 cred=0
 *
 close databases
 restscreen(00,00,24,80,contap)
 set intensity on
 break
 exit
 endif

        if empty(ocorr)
        pocorre()
        loop
        endif
 locate for codigo=ocorr

 if found()
 @ 10,48 say alltrim(categoria)
 else
 alert("Categoria n∆o existente !!!")
 pocorre()
 loop
 endif

 exit
 enddo
 break
 end
 *******************************************

 if lastkey()=27
 cod=0
 histo=space(33)
 cond=space(01)
 public ocorr:=0
 teste=0
 teste2=0
 val=0
 dat=ctod(space(08))
 deb=0
 cred=0
 *
 close databases
 restscreen(00,00,24,80,contap)
 set intensity on
 return
 exit
 endif

   wait""

  sele 2

  x=alert("Confirmar Digitaá∆o",{"Sim","N∆o"})
      if x=1
             if cond="C"
             append Blank
             replace data with dat
             replace codigo with ocorr
             replace historico with histo
             replace credito with val
             replace saldo with tt
             endif

             if cond="D"
             append Blank
             replace data with dat
             replace codigo with ocorr
             replace historico with histo
             replace debito with val
             replace saldo with tt2
             endif

        *
        cod=0
        histo=space(33)
        cond=space(01)
        ocorr=0
        teste=0
        teste2=0
        val=0
        dat=ctod(space(08))
        deb=0
        cred=0
        *
        close(arq)
        close(arq2)
        restscreen(00,00,24,80,tlancamento)
        loop
      endif

      if x=2
      loop
      endif
enddo


return


                procedure pcontas
                close  contas
                sele 1
                use contas
                go top
                declare vpc[1],vpc2[1]
                vpc[1]="nome"
                vpc2[1]="Nome da Conta"
                set color to /p
                @ 10,20 clear to 22,62
                set color to p/w+,w+/b+
                @ 09,19 to 21,61
                dbedit(10,20,20,60,vpc,,"",vpc2,chr(196),chr(179),)
                cod=codigo
                restscreen(00,00,24,80,tlancamento)
                close contas
                sele 1
                use contas 
                return

                procedure pocorre
                temp=space(30)
                temp=savescreen(00,00,24,80)
                set delimiters on
                set delimiters to "[]"
                sele 3
                go top
                set color to /p
                @ 10,20 clear to 22,62
                set color to p/w+,w+/b+
                @ 09,19 to 21,61
                declare vt1[1],vt2[1]
                vt1[1]="categoria"
                vt2[1]="Categoria"
                dbedit(10,20,20,60,vt1,,"",vt2,chr(196),chr(179),)
                ocorr=codigo
                restscreen(00,00,24,80,temp)
                return

procedure ex_conta

*
set procedure to telas
set intensity off
set delimiters on
set delimiters to "[]"
set console off
set confirm off
*
tex_conta()
*

*
cod=0
arq=space(10)
arq2=space(10)
*

sele 1
use contas.dbf 
*
do while .t.
sele 1
@ 11,30 get cod pict "9999"
read
        if lastkey()=27
        cod=0
        arq=space(10)
        arq2=space(10)
        *
        close databases
        restscreen(00,00,24,80,contap)
        set intensity on
        return
        exit
        endif

        if empty(cod)
        pcontas2()
        loop
        endif

locate for codigo=cod

if found()
@ 12,30 say alltrim(nome)
@ 13,30 say alltrim(arquivo)
@ 14,30 say alltrim(indice)
arq=alltrim(arquivo)+".DBF"
arq2=alltrim(indice)+".DBF"
wait""
x=alert("Confirmar Exclus∆o !!!",{"Sim","N∆o"})
                if x=1
                erase(arq)
                erase(arq2)
                delete
                pack
                endif

                if x=2
                loop
                endif
else
alert("Arquivo Inexistente")
pcontas2()
endif

restscreen(00,00,24,80,tex_conta)
cod=0
arq=space(10)
arq2=space(10)


enddo


return
                procedure pcontas2
                close  contas
                sele 1
                use contas
                go top
                declare vpc[1],vpc2[1]
                vpc[1]="nome"
                vpc2[1]="Nome da Conta"
                set color to /p
                @ 10,20 clear to 22,62
                set color to p/w+,w+/b+
                @ 09,19 to 21,61
                dbedit(10,20,20,60,vpc,,"",vpc2,chr(196),chr(179),)
                cod=codigo
                restscreen(00,00,24,80,tex_conta)
                close contas
                sele 1
                use contas 
                return

* PROCEDURE SALDO DA CONTA
procedure saldo
*
set procedure to telas
set intensity off
set delimiters on
set delimiters to "[]"
set console off
set confirm off
*
cods=0
sald=0
debs=0
creds=0
cont=0
cont2=0
aq=space(10)
*
tsaldo()
*
sele 1
use contas.dbf
*

do while .t.
sele 1

@ 11,30 get cods pict "9999"
read
        if lastkey()=27
        cods=0
        sald=0
        debs=0
        creds=0
        cont=0
        cont2=0
        aq=space(10)
        *
        close databases
        restscreen(00,00,24,80,contap)
        set intensity on
        return
        exit
        endif

        if empty(cods)
        pcontas3()
        loop
        endif

locate for codigo=cods

if found()
aq=arquivo
sele 2
use(aq)
cont=recno()
cont2=recno()
? cont
        for i=0 to 100000
        debs=debs+debito
        i=i+1
        skip
        next

        go top

        for i=0 to 100000
        creds=creds+credito
        i=i+1
        skip
        next

        
@ 12,30 say debs pict "99999.99"
@ 13,30 say creds pict "99999.99"
sald=creds-debs 
@ 14,30 say sald pict "99999.99"
wait""
endif

cods=0
saldo=0
debs=0
creds=0
cont=0
cont2=0
aq=space(10)
restscreen(00,00,24,80,tsaldo)
loop

enddo
return
        
                procedure pcontas3
                close  contas
                sele 1
                use contas
                go top
                declare vpc[1],vpc2[1]
                vpc[1]="nome"
                vpc2[1]="Nome da Conta"
                set color to /p
                @ 10,20 clear to 22,62
                set color to p/w+,w+/b+
                @ 09,19 to 21,61
                dbedit(10,20,20,60,vpc,,"",vpc2,chr(196),chr(179),)
                cods=codigo
                restscreen(00,00,24,80,tsaldo)
                close contas
                sele 1
                use contas 
                return

* PROCEDURE DE INCLUS«O DE CATEGORIA
procedure in_categ
*
set procedure to telas
set intensity off
set delimiters on
set delimiters to "[]"
set console off
set confirm off
*
tin_categ()
*
declare vec[1],vec2[1]
vec[1]="nome"
vec2[1]="Nome da Conta"
cnome=space(30)
carquivo=space(15)
ccod=0
categ=space(20)
*
sele 1
use contas.dbf
*
do while .t.
sele 1
dbedit(10,03,14,38,vec,,"",vec2,chr(196),chr(179),)
cnome=nome
carquivo=alltrim(indice)

                        if lastkey()=27
                        cnome=space(30)
                        carquivo=space(15)
                        ccod=0
                        categ=space(20)
                        restscreen(00,00,24,80,categoriap)
                        set intensity on
                        close databases
                        return
                        exit
                        endif

@ 12,54 say alltrim(cnome)

sele 2
use(carquivo)

go bottom
ccod=codigo+1

@ 13,54 say ccod pict "999"
@ 14,54 get categ pict "@!"
read

if lastkey()=27
set intensity on
cnome=space(30)
carquivo=space(15)
ccod=0
categ=space(20)
restscreen(00,00,24,80,categoriap)
close databases
return
exit
endif


append blank
replace codigo with ccod
replace categoria with categ
commit

sele 1
go top
cnome=space(30)
carquivo=space(15)
ccod=0
categ=space(20)
restscreen(00,00,24,80,tin_categ)
enddo
return


* PROCEDURE CONSULTA DE CATEGORIAS
procedure con_categ
*
set procedure to telas
set delimiters on
set delimiters to "[]"
set console off
set confirm off
*
tcon_categ()
*
declare vec[1],vec2[1],vec3[2],vec4[2]
vec[1]="nome"
vec2[1]="Nome da Conta"
vec3[1]="codigo"
vec3[2]="categoria"
vec4[1]="Codigos"
vec4[2]="Categorias"

conc=space(15)
*
sele 1
use contas.dbf

do while .t.
sele 1
dbedit(10,03,14,38,vec,,"",vec2,chr(196),chr(179),)
conc=alltrim(indice)
                if lastkey()=27
                conc=space(15)
                restscreen(00,00,24,80,categoriap)
                close databases
                return
                exit
                endif
sele 2
use(conc)
dbedit(10,40,14,76,vec3,,"",vec4,chr(196),chr(179),)
                if lastkey()=27
                conc=space(15)
                restscreen(00,00,24,80,categoriap)
                close databases
                return
                exit
                endif

sele 1
go top
conc=space(15)
restscreen(00,00,24,80,tcon_categ)
enddo
return
