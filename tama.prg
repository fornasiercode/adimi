******************************************************************************
* - CCD - 2001 -                                                             *
* - CONTAS CORRENTES DIVERSSAS -                                             *
* - L . B . F  SOFTWARE -                                                    *
* - Criado por : Leonardo Brum fornasier                                     *                                         *
* - Analise : Sergio fornasier                                               *
* - LBFCONTA.PRG -                                                           *
******************************************************************************
clear memory

** SET'S
set score off
set date british
set intensity on
set century on
set wrap on
set procedure to procs
**

** VARIAVEIS
menup=2
telap=space(30)
contap=space(30)
conta=1
** TELA
clear

set color to w+/w+
for i=0 to 24
@ i,00 say repl ("Û",80)
next

*

set color to p/w+,w+/b+
@ 00,00 clear to 00,80
@ 24,00 clear to 24,80
*
@ 24,68 say "C.C.D-2001"
@ 24,02 say "L.B.F - Software"

** ESTRUTURA
do while .t.
@ 00,01 prompt " - "
@ 00,04 prompt " Conta "
@ 00,12 prompt " Relat¢rios "
@ 00,24 prompt " Categorias "
@ 00,36 prompt " Backup "
@ 00,44 prompt " Ajuda "
@ 00,76 prompt " x "
menu to menup
telap=savescreen(00,00,24,80)
do case
case menup=2
do conta
case menup=7
do saida
exit
endcase

enddo


* PROCEDURES DE MENU

procedure conta
set color to /p
@ 03,05 clear to 07,26
set color to p/w+,w+/b+

@ 02,04 clear to 06,25
@ 02,04 to 06,25
*
do while .t.
@ 03,05 prompt " Nova Conta         "
@ 04,05 prompt " Lan‡amento         "
@ 05,05 prompt " Excluir Conta      "
menu to conta
contap=savescreen(00,00,24,80)
*
if lastkey()=27
restscreen(00,00,24,80,telap)
exit
endif
*

do case

case conta=1
do conta_nova

case conta=2
do lancamento
endcase

enddo

return


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
do tconta_nova
*

*
nomeconta=space(26)
cod=0
public arqconta:=(04)
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


  if isalpha(arqconta)=.f.
  loop
  endif


@ 13,30 say arqconta+".DBF" pict "@!"
wait""

* BDD
        append blank
        replace codigo with cod
        replace nome with nomeconta
        replace arquivo with arqconta

do cria

restscreen(09,10,14,63,tconta_nova)
nomeconta=space(30)
arqconta=space(08)
cod=0
enddo
return

* PROCEDURE DE CRIA€ÇO DE BANCO DE DADOS

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


* PROCEDURE LAN€AMENTO

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
do tlancamento
*
sele 1
use contas index codigo
sele 2
use ocorre index cod
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
       do pcontas
       loop
       endif

       ********************************

seek cod


       if found()
       @ 05,49 say alltrim(nome) 
       arq=arquivo
       sele 3
       use(arq)
       endif

       *


 dat=date()

 @ 06,42 say dat
 @ 07,42 get histo pict "@!"
 @ 08,42 get cond pict "@!";
 valid cond="C" .or. cond="D"
 @ 09,42 get ocorr pict "999"
 @ 10,42 get val pict "9999.99"
 read

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

 if cond="C"
 tt=cred+val
 @ 10,55 say tt pict "9999.99"
 endif

 if cond="D"
 tt2=deb-val
 @ 10,55 say tt2  pict "9999.99"
 endif

 wait""

  x=alert("Confirmar Digita‡Æo",{"SIM","NÇO"})
      if x=1
             if cond="C"
             append Blank
             replace data with dat
             replace codigo with ocorr
             replace historico with histo
             replace credito with tt
             replace saldo with credito
             endif

             if cond="D"
             append Blank
             replace data with dat
             replace codigo with ocorr
             replace historico with histo
             replace debito with tt2
             replace saldo with debito
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

        close databases
        restscreen(00,00,24,80,contap)
        set intensity on
        return
        exit

      endif

      if x=2
      loop
      endif
enddo


return


                procedure pcontas
                close databases
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
                close databases
                sele 1
                use contas index codigo
                sele 2
                use ocorre index cod
                return

                procedure pocorre
                close databases
                sele 1
                use ocorre
                go top
                set color to /p
                @ 10,20 clear to 22,62
                set color to p/w+,w+/b+
                @ 09,19 to 21,61
                dbedit(10,20,20,60,,"",,chr(196),chr(179),)
                ocorr=codigo
                restscreen(00,00,24,80,tlancamento)
                close databases
                sele 1
                use contas index codigo
                sele 2
                use ocorre index cod
                return

************************
* PROCEDURES DE TELAS  *
************************

* TELA CONTA NOVA

procedure tconta_nova
public tconta_nova:=space(30)

set color to /p
@ 10,11 clear to 15,64
*
set color to p/w+,w+/b+
@ 09,10 clear to 14,63
*
@ 09,10 to 14,63
*
@ 10,12 say "Conta.Nova:"
@ 11,12 say "Numero.Conta....:"
@ 12,12 say "Nome.conta......:" 
@ 13,12 say "Arquivo.Conta...:"
tconta_nova=savescreen(09,10,14,63)
return

* TELA LAN€AMENTO

procedure tlancamento
public tlancamento:=space(30)

set color to /p
@ 03,29 clear to 12,78
*
set color to p/w+,w+/b+

@ 02,28 clear to 11,77
*
@ 02,28 to 11,77
*
@ 03,30 say "Lan‡amento.CONTAS:"
@ 05,30 say "Conta......:"
@ 06,30 say "Data.......:"
@ 07,30 say "Historico..:"
@ 08,30 say "D/C........:"
@ 09,30 say "Ocorremcia.:"
@ 10,30 say "Valor......:"
tlancamento=savescreen(00,00,24,80)

return


