//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// ADIMI.PRG                                                                //
// OBJETIVO:Menu para levar as outras partes do programa                    //
//////////////////////////////////////////////////////////////////////////////
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set wrap on
setcancel(.f.)
//////////////////////////////////////////////////////////////////////////////
desktop()
////VARIAVEIS/////////////////////////////////////////////////////////////////
store space(30) to tadimi,testoque
store 1 to adimi,funciona,estoque,fornece,faturame,vendas
store 1 to menestoque,menfornece,menfunciona
//////////////////////////////////////////////////////////////////////////////


////TELA PRINCIPAL////////////////////////////////////////////////////////////

setcolor("w/w");@ 01,00 clear to 24,80


///SOMBRA
setcolor("/n")
@ 20,06 clear to 23,75
///JENELAS
setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80

@ 00,00 clear to 00,80
@ 19,05 clear to 22,74
@ 19,05 to 22,74 
//
@ 20,07 say "ADIMI-2000"
@ 21,07 say "VERSÇO 2.0"
@ 20,63 say date()
@ 21,65 say time()
//////////////////////////////////////////////////////////////////////////////
do while .t.
////MENU PRINCIPAL////////////////////////////////////////////////////////////

@ 00,02 prompt "Funcionarios"
@ 00,17 prompt "Estoque"
@ 00,27 prompt "Fornecedores"
@ 00,42 prompt "Faturamento"
@ 00,56 prompt "Vendas"
@ 00,65 prompt "Contas"
@ 00,73 prompt "Sair"
menu to adimi
tadimi=savescreen(00,00,24,80)
do case

case adimi=1
do funci

case adimi=2
set color to
do estoq

case adimi=3
set color to
do forne

case adimi=4
set color to
do fatura

case adimi=5
set color to
do vend
case adimi=6
set color to
do conta
case adimi=7
set color to
setmode(25,80)
close databases
clear
return


endcase

enddo



