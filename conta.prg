//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// CONTA.PRG                                                                //
// OBJETIVO:Levar as varias opera‡äes com Contas                            //
//////////////////////////////////////////////////////////////////////////////
clear
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set bell on
set wrap on
set message to 21 center
set color to w+/b+
//////////////////////////////////////////////////////////////////////////////
////VARIAVEIS/////////////////////////////////////////////////////////////////
conta=1
contat=space(30)
contat2=space(30)
contat3=space(30)
geral=ctod(space(30))
////TELA PRINCIPAL////////////////////////////////////////////////////////////
sele 1
use conta.dbf
///FUNDO
setcolor("w/w");@ 01,00 clear to 24,80
///SOMBRA
setcolor(" /n")
@ 21,06 clear to 23,75
@ 04,06 clear to 16,75

///JENELAS
setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80

@ 00,00 clear to 00,80
//
@ 20,05 clear to 22,74
@ 20,05 to 22,74 
//
@ 03,05 clear to 15,74
@ 03,05 to 15,74
//
@ 03,05 to 05,74
@ 04,07 say "Data.Conta....:"
contat2=savescreen(03,05,15,74)
/////ESTRUTURA DE PROGRAMA€ÇO/////////////////////////////////////////////////

do venci_conta

do while .t.
@ 00,02 prompt "Cadastrar" message "Cadastra as contas a pagar"
@ 00,19 prompt "Consultar" message "Consulta as contas a pagar pela data especificada"
@ 00,37 prompt "Pague|hoje" message "Mostra AVISO das contas especificadas para este dia"
@ 00,54 prompt "Pagamento" message "Paga as Contas devedoras"
@ 00,73 prompt "Voltar" message "Volta ao menu principal"
menu to conta
contat=savescreen(03,05,15,74)
do case
case conta=1
do cad_conta
case conta=2
do consulta
case conta=3
do aviso
case conta=4
do pagamento
case conta=5
restore screen from tadimi
close databases
return

endcase

enddo

////////PROCEDURES/////////////////////////////////////////////////////////////

procedure cad_conta
set intensity off
venci=ctod(space(08))
avisov=ctod(space(08))
teste=ctod(space(08))

store 0 to valorv
store space(30) to nomev
teste=date()
sele 1
@ 03,05 to 15,74

@ 04,06 clear to 14,73
@ 04,07 say "* Cadastro das contas a Pagar"
@ 06,07 say "Dia.do.Vencimento.:"
@ 08,07 say "Nome.da.Conta.....:"
@ 10,07 say "Aviso.Para.Pagar..:"
@ 12,07 say "Valor.da.Conta....:"
////
do while .t.
@ 06,27 get venci
@ 08,27 get nomev pict "@!"
@ 10,27 get avisov
@ 12,27 get valorv pict "9999.99"
read

if lastkey()=27
x=alert("Abortar Opera‡Æo",{"Sim","NÆo"})
  if x=1
  set intensity on
  restscreen(03,05,15,74,contat)
  venci=ctod(space(08))
  avisov=ctod(space(08))
  store 0 to valorv
  store space(30) to nomev
  return
  endif

  if x=2
  loop
  endif
endif
a=alert("Confirmar Conta",{"Sim","NÆo"})
        if a=1
        ///
        append blank
        replace vencimento with venci
        replace nome with nomev
        replace aviso with avisov
        replace valor with valorv
        commit
        ///
        endif
        if a=2
        loop
        endif

x=alert("Continuar Incluindo",{"Sim","NÆo"})
             if x=1
             venci=ctod(space(08))
             avisov=ctod(space(08))
             store 0 to valorv
             store space(30) to nomev
             loop
             endif
             if x=2
             set intensity on
             restscreen(03,05,15,74,contat)
             venci=ctod(space(08))
             avisov=ctod(space(08))
             store 0 to valorv
             store space(30) to nomev
             return
             endif
enddo
return
////////////////////////////////////////////////////////////////////////////////

procedure venci_conta
sele 1
@ 00,02 say "* CONTAS QUE ESTÇO VENCENDO HOJE !!!"
hoje=ctod(space(08))
hoje=date()
@ 04,22 say hoje
set filter to vencimento=hoje
declare vet2[4],v2[4]
vet2[1]="vencimento"
vet2[2]="nome"
vet2[3]="aviso"
vet2[4]="valor"

v2[1]="Vencimento"
v2[2]="Nome Conta"
v2[3]="Aviso Dado"
v2[4]="Valor Conta"

dbedit (07,06,14,73,vet2,,"",v2,chr(196),chr(179),)
@ 00,00 clear to 00,80
restscreen(03,05,15,74,contat2)
return

////////////////////////////////////////////////////////////////////////////////

procedure consulta
do while .t.
set intensity off
sele 1
@ 04,22 get geral
read

if lastkey()=27
x=alert("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        restscreen(03,05,15,74,contat)
        geral=ctod(space(30))
        set intensity on
        return
        endif

        if x=2
        loop
        endif
endif

set filter to vencimento=geral
declare vet2[4],v2[4]
vet2[1]="vencimento"
vet2[2]="nome"
vet2[3]="aviso"
vet2[4]="valor"

v2[1]="Vencimento"
v2[2]="Nome Conta"
v2[3]="Aviso Dado"
v2[4]="Valor Conta"

set intensity on
dbedit (07,06,14,73,vet2,,"",v2,chr(196),chr(179),)

x=alert("Continuar Consultando",{"Sim","NÆo"})
        if x=1
        geral=ctod(space(30))
        restscreen(03,05,15,74,contat)
        loop
        endif

        if x=2
        restscreen(03,05,15,74,contat)
        geral=ctod(space(30))
        set intensity on
        return
        endif
enddo
return

//////////////////////////////////////////////////////////////////////////////

procedure aviso
sele 1
@ 00,00 clear to 00,80
@ 00,02 say "* CONTAS SELECIONADAS PARA SEREM PAGAS HOJE !!!"
hoje2=ctod(space(08))
hoje2=date()
@ 04,22 say hoje2
set filter to aviso=hoje2
declare vet2[4],v2[4]
vet2[1]="vencimento"
vet2[2]="nome"
vet2[3]="aviso"
vet2[4]="valor"

v2[1]="Vencimento"
v2[2]="Nome Conta"
v2[3]="Aviso Dado"
v2[4]="Valor Conta"

dbedit (07,06,14,73,vet2,,"",v2,chr(196),chr(179),)
@ 00,00 clear to 00,80
restscreen(03,05,15,74,contat2)

return
//////////////////////////////////////////////////////////////////////////////

procedure pagamento
do while .t.
set intensity off
sele 1
@ 04,22 get geral
read

if lastkey()=27
x=alert("Abortar Opera‡Æo",{"Sim","NÆo"})
        if x=1
        restscreen(03,05,15,74,contat)
        geral=ctod(space(30))
        set intensity on
        return
        endif

        if x=2
        loop
        endif
endif

if empty(geral)
loop
endif

set filter to vencimento=geral
declare vet2[4],v2[4]
vet2[1]="vencimento"
vet2[2]="nome"
vet2[3]="aviso"
vet2[4]="valor"

v2[1]="Vencimento"
v2[2]="Nome Conta"
v2[3]="Aviso Dado"
v2[4]="Valor Conta"

set intensity on

dbedit (07,06,14,73,vet2,,"",v2,chr(196),chr(179),)
contat3=savescreen(03,05,15,74)
do paga

x=alert("Continuar efetuando pagamentos",{"Sim","NÆo"})
        if x=1
        geral=ctod(space(30))
        restscreen(03,05,15,74,contat)
        loop
        endif

        if x=2
        restscreen(03,05,15,74,contat)
        geral=ctod(space(30))
        set intensity on
        return
        endif
enddo
return
///////////////////////////////////////////////////////////////////////////////
procedure paga
set intensity off
sele 1
pago=0
tempc=0
setcolor("/n")
@ 09,21 clear to 13,66
//
setcolor( "n*/w,w+/b" )
@ 08,20 clear to 12,65
@ 08,20 to 12,65
//

@ 09,22 say "* DESEJA PAGAR QUE VALOR PARA A CONTA !!!"
@ 11,22 say "Valor.Pagar.....:" get pago pict "9999.99"
read
        if valor=pago
        delete
        pack
        endif

        if pago < valor
        tempc=valor-pago
        replace valor with tempc
        endif

restscreen(03,05,15,74,contat3)
set intensity on
return
