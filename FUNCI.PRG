//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// FUNCI.PRG                                                                //
// OBJETIVO:Levar as varias opera‡äes com funcionarios                      //
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
//////////////////////////////////////////////////////////////////////////////
////VARIAVEIS/////////////////////////////////////////////////////////////////
funci=1
tfunci=space(30)
////TELA PRINCIPAL////////////////////////////////////////////////////////////

///FUNDO

setcolor("w/w");@ 01,00 clear to 24,80

///SOMBRA
setcolor(" /n")
@ 21,06 clear to 23,75
@ 03,06 clear to 18,75

///JENELAS
setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80

@ 00,00 clear to 00,80
@ 20,05 clear to 22,74
@ 20,05 to 22,74 
@ 02,05 clear to 17,74
@ 02,05 to 17,74
//
/////
@ 03,07 say "Codigo......:"  
@ 04,07 say "Nome........:"
@ 05,07 say "Filia‡Æo.Pai:                           MÆe:                  "  
@ 06,07 say "Data.Nasc...:                           Num.Filhos:           "                                         
@ 07,07 say "Telefone....:"
@ 08,07 say "Estado.Civil:"                              
@ 09,07 say "Indentidade.:                                                 "
@ 10,07 say "CPF.........:"
@ 11,07 say "CNT.........:"
@ 12,07 say "Serv.Militar:"
@ 13,07 say "Tit.Eleitor.:"
@ 14,07 say "Endere‡o....:                           Bairro:                "
@ 15,07 say "Cidade......:                           UF:                    "
@ 16,07 say "CEP.........:"

//////////////////////////////////////////////////////////////////////////////




////MENU DO FUNCI/////////////////////////////////////////////////////////////
do while .t.
@ 00,02 prompt "Incluir" message "Incluir Funcionarios"
@ 00,20 prompt "Excluir" message "Excluir Funcionarios"
@ 00,38 prompt "Consultar" message "Consultar Funcionarios"
@ 00,58 prompt "Alterar" message "Alterar Funcionarios"
@ 00,73 prompt "Voltar" message "Volta ao menu principal"
tfunci=savescreen(00,00,24,80)   
menu to funci
do case
case funci=1
do infunc
case funci=2
do exfunc
case funci=3
do confunc
case funci=4
do alfunc
case funci=5
restore screen from tadimi
return

endcase

enddo
