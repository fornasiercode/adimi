//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERSÆO 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// ESTOQ.PRG                                                                //
// OBJETIVO:Levar as varias opera‡äes com Estoque                           //
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
estoq=1
testoq=space(30)
////TELA PRINCIPAL////////////////////////////////////////////////////////////
setcolor("w/w");@ 01,00 clear to 24,80

///SOMBRA
setcolor("/n")
@ 21,06 clear to 23,75
@ 07,06 clear to 16,75

///JENELAS
setcolor( "n*/w,w+/b" );@ 00,00 clear to 00,80

@ 00,00 clear to 00,80
//
@ 20,05 clear to 22,74
@ 20,05 to 22,74 
//
@ 06,05 clear to 15,74
@ 06,05 to 15,74
//
/////
@ 07,07 say "Codigo......:"  
@ 08,07 say "Produto.....:"
@ 09,07 say "Quantidade..:"
@ 10,07 say "Estoq.Mini..:"
@ 11,07 say "Pre‡o.Custo.:"                                                            
@ 12,07 say "Pre‡.Un.Cust:"
@ 13,07 say "Pre‡.Un.Vend:"
@ 14,07 say "Margem.Lucro:"
//////////////////////////////////////////////////////////////////////////////

////MENU DO ESTOQ/////////////////////////////////////////////////////////////
do while .t.
@ 00,02 prompt "Incluir" message "Incluir Mercadoria no Estoque"
@ 00,20 prompt "Excluir" message "Excluir Mercadoria no Estoque"
@ 00,38 prompt "Consultar" message "Consultar Mercadoria no Estoque"
@ 00,58 prompt "Entrada" message "Alterar Mercadoria do Estoque"
@ 00,73 prompt "Voltar" message "Volta ao menu principal"
save screen to testoq
menu to estoq
do case
case estoq=1
do inestoq
case estoq=2
do exestoq
case estoq=3
do conestoq
case estoq=4
do altestoq
case estoq=5
restore screen from tadimi
return

endcase

enddo
procedure vestoq
sele 1
use estoque.dbf
i=0
do while .t.
locate for estoq_min=quantidade

if found ()
i=i+1
@ i,08 say produto
endif
skip
enddo
@ 06,05 to 15,74 
dbedit (07,06,14,73,vet2,,"",v2,chr(196),chr(179),)
restore screen from testoq
set intensity on

return
