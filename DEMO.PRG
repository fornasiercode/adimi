//////////
// DEMO.PRG - Programa de demonstracao da Visual Lib 2.0
//
// CLIPPER DEMO
// RTLINK FI DEMO LIB VL2_SW
//////////

#include "inkey.ch"
#include "visual2.ch"

local aEnv

set deleted on
set date british
set scoreboard off

set key K_F10 to Saida  //Funcao utilizar  VLExit() da Visual Lib

SetKeyMouse( K_F1,  { 24, 24, 00, 07 } ) //VL-Associa tecla de fun‡Æo … uma
SetKeyMouse( K_F10, { 24, 24, 72, 79 } ) //regiao da tela - uso do mouse

//VL-Desenha a  rea de trabalho e inicializa mouse
Desktop("DEMO - Demostracao de utilizacao da Visual Lib v2.0") //Fun‡Æo que inicializa a Visual Lib - Sempre deve ser chamada no inicio

DrawFn( 01, "Sobre" )   //VL-Desenha fun‡Æo na linha 24
DrawFn( 10, "Sa¡da" )   //VL-Desenha fun‡Æo na linha 24

// Criando todos os Menus e Sub-Menus (inicialmente vazios)

mBar := NewBarMenu()            //(VL) Cria Menu de Barra
mPdn := NewDownMenu()           //(VL) Cria Menu Down vinculado a mBar
mBut := NewDownMenu()           //(VL) Cria Menu Down vinculado a mBar
mJan := NewDownMenu()           //(VL) Cria Menu Down vinculado a mBar
mDiv := NewDownMenu()           //(VL) Cria Menu Down vinculado a mBar
mPdn1 := NewDownMenu()          //(VL) Cria Sub-Menu vinculado a mPdn
mPdn2 := NewDownMenu()          //(VL) Cria Sub-Menu vinculado a mPdn1
mPdnChk := NewDownMenu()        //(VL) Cria Sub-Menu vinculado a mPdn
mPdnSet := NewDownMenu()        //(VL) Cria Sub-Menu vinculado a mPdn
mJanMsg := NewDownMenu()        //(VL) Cria Sub-Menu vinculado a mJan
mJanM3d := NewDownMenu()        //(VL) Cria Sub-Menu vinculado a mJan
mJanFrm := NewDownMenu()        //(VL) Cria Sub-Menu vinculado a mJan
mJanDsk := NewDownMenu()        //(VL) Cria Sub-Menu vinculado a mJan

// mBar - Defini‡Æo dos itens
//        Para os trˆs primeiros itens, informamos os "Menus Down"
//        Para os dois £ltimos, informamos um code-block

AddBarItem( mBar, "&Pull-Down" , "Demonstra‡Æo dos recursos do Menu Pull-Down", mPdn )
AddBarItem( mBar, "&Botäes 3D" , "Demonstra‡Æo dos botäes e molduras 3D", mBut )
AddBarItem( mBar, "&Janelas"   , "Demonstra‡Æo das janelas de Mensagem/Confirma‡Æo", mJan )
AddBarItem( mBar, "&Diversos"  , "GET, TBROWSE e Sombra na VISUAL LIB", mDiv )

// mPdn - Defini‡Æo dos itens
//        Os dois primeiros itens nÆo executarÆo nada (apenas teste)
//        Ao terceiro item vinculamos um sub-menu para teste

AddDownItem( mPdn, "Op‡Æo &1", "Primeira Op‡Æo - Sem fun‡Æo vinculada" )
AddDownItem( mPdn, "Op‡Æo &2", "Segunda Op‡Æo - Sem fun‡Æo vinculada" )
AddDownItem( mPdn, "Op‡Æo &3", "Terceira Op‡Æo - Com Sub-Menu", mPdn1 )
AddDownSep ( mPdn )     // Linha de separa‡Æo
AddDownItem( mPdn, "&ChkDownItem", "Marca/Desmarca um item do menu", mPdnChk )
AddDownItem( mPdn, "&SetDownItem", "Habilita/Desabilita um item do menu", mPdnSet )
AddDownSep ( mPdn )     // Linha de separa‡Æo
AddDownItem( mPdn, "Sai&r", "Encerra o programa", { || Saida() } )
   
// mPdn1 - Defini‡Æo dos itens (sub-menu de mPdn)
//         Apenas para ilustrar o encadeamento de sub-menus
//         Note que informamos na "Op‡Æo 3" mais um sub-menu (mPdn2)

AddDownItem( mPdn1, "Sub-Menu &1", "Primeira Op‡Æo - Sem fun‡Æo vinculada" )
AddDownItem( mPdn1, "Sub-Menu &2", "Segunda Op‡Æo - Sem fun‡Æo vinculada" )
AddDownItem( mPdn1, "Sub-Menu &3", "Terceira Op‡Æo - Com Sub-Menu", mPdn2 )

// mPdn2 - Defini‡Æo dos itens (sub-menu de mPdn1)
//         Apenas para ilustrar o encadeamento de sub-menus
//         Este ‚ um sub-menu de um outro sub-menu

AddDownItem( mPdn2, "Sub-Menu &1", "Primeira Op‡Æo - Sem fun‡Æo vinculada" )
AddDownItem( mPdn2, "Sub-Menu &2", "Segunda Op‡Æo - Sem fun‡Æo vinculada" )
AddDownItem( mPdn2, "Sub-Menu &3", "Terceira Op‡Æo - Sem fun‡Æo vinculada" )

// mPdnChk - Defini‡Æo dos itens (sub-menu de mPdn)
//           Observe que o code-block faz todo o trabalho

AddDownItem( mPdnChk, "Check &1", "Marca/Desmarca Check 1", { || ChkDownItem( mPdnChk, 1, !ChkDownItem( mPdnChk, 1 ) ) } )
AddDownItem( mPdnChk, "Check &2", "Marca/Desmarca Check 2", { || ChkDownItem( mPdnChk, 2, !ChkDownItem( mPdnChk, 2 ) ) } )
AddDownItem( mPdnChk, "Check &3", "Marca/Desmarca Check 3", { || ChkDownItem( mPdnChk, 3, !ChkDownItem( mPdnChk, 3 ) ) } )
AddDownItem( mPdnChk, "Check &4", "Marca/Desmarca Check 4", { || ChkDownItem( mPdnChk, 4, !ChkDownItem( mPdnChk, 4 ) ) } )
AddDownItem( mPdnChk, "Check &5", "Marca/Desmarca Check 5", { || ChkDownItem( mPdnChk, 5, !ChkDownItem( mPdnChk, 5 ) ) } )

// mPdnSet - Defini‡Æo dos itens (sub-menu de mPdn)
//           Observe que o code-block faz todo o trabalho

AddDownItem( mPdnSet, "Set &1", "Habilita/Desabilita Set 1", { || SetDownItem( mPdnSet, 1, !SetDownItem( mPdnSet, 1 ) ) } )
AddDownItem( mPdnSet, "Set &2", "Habilita/Desabilita Set 2", { || SetDownItem( mPdnSet, 2, !SetDownItem( mPdnSet, 2 ) ) } )
AddDownItem( mPdnSet, "Set &3", "Habilita/Desabilita Set 3", { || SetDownItem( mPdnSet, 3, !SetDownItem( mPdnSet, 3 ) ) } )
AddDownItem( mPdnSet, "Set &4", "Habilita/Desabilita Set 4", { || SetDownItem( mPdnSet, 4, !SetDownItem( mPdnSet, 4 ) ) } )
AddDownItem( mPdnSet, "Set &5", "Habilita/Desabilita Set 5", { || SetDownItem( mPdnSet, 5, !SetDownItem( mPdnSet, 5 ) ) } )

// mBut - Defini‡Æo dos itens
//        O c¢digo necessario est  no code-block

AddDownItem( mBut, "LinButton&1()", "Demonstra fun‡Æo LinButton1()", { || LinButton1( ,,,, 'BotÆo "OK" de LinButton1()' ), Clrted( 20 ) } )
AddDownItem( mBut, "LinButton&2()", "Demonstra fun‡Æo LinButton2()", { || LinButton2( ,,,,,, 'BotÆo "OK" de LinButton2()' ,, 'BotÆo "Cancelar" de LinButton2()' ), Clrted( 20 ) } )
AddDownItem( mBut, "LinButton&3()", "Demonstra fun‡Æo LinButton3()", { || LinButton3( ,,,,,, 'BotÆo "OK" de LinButton3()' ,, 'BotÆo "Alterar" de LinButton3()' ,, 'BotÆo "Cancelar" de LinButton3()' ), Clrted( 20 ) } )
AddDownItem( mBut, "LinButton&4()", "Demonstra fun‡Æo LinButton4()", { || LinButton4( ,,,,,, 'BotÆo "OK" de LinButton4()' ,, 'BotÆo "Alterar" de LinButton4()' ,, 'BotÆo "Excluir" de LinButton4()' ,, 'BotÆo "Cancelar" de LinButton4()'), Clrted( 20 ) } )

// mJan - Defini‡Æo dos itens
//        Todos os itens tem sub-menus

AddDownItem( mJan, "&MsgBox()" , "Demonstra fun‡äes MsgBox()", mJanMsg )
AddDownItem( mJan, "Msg&Box3d()", "Demonstra fun‡äes MsgBox3d()", mJanM3d )
AddDownSep ( mJan )     // Linha de separa‡Æo
AddDownItem( mJan, "&Frame()", "Demonstra fun‡Æo Frame()", mJanFrm )
AddDownItem( mJan, "&DeskBox()", "Demonstra fun‡Æo DeskBox()", mJanDsk )

// mJanMsg - Defini‡Æo dos itens (sub-menu de mJan)
//           O c¢digo necess rio est  no code-block

//AddDownItem( mJanMsg, "&MsgBox()" , "Demonstra fun‡Æo MsgBox()", { || aEnv := MsgBox( "Fun‡Æo MsgBox()" ), WaitState(), RstEnv( aEnv ) } )
AddDownItem( mJanMsg, "MsgBox&1()", "Demonstra fun‡Æo MsgBox1()", { || MsgBox1( "Fun‡Æo MsgBox1()" ) } )
AddDownItem( mJanMsg, "MsgBox&2()", "Demonstra fun‡Æo MsgBox2()", { || MsgBox2( "Fun‡Æo MsgBox2()" ) } )
AddDownItem( mJanMsg, "MsgBox&3()", "Demonstra fun‡Æo MsgBox3()", { || MsgBox3( "Fun‡Æo MsgBox3()" ) } )

// mJanM3d - Defini‡Æo dos itens (sub-menu de mJan)
//           O c¢digo necess rio est  no code-block

AddDownItem( mJanM3d, "MsgBox3&d()", "Demonstra fun‡Æo MsgBox3d()", { || aEnv := MsgBox3d( "Fun‡Æo MsgBox3d()" ), WaitState(), RstEnv( aEnv ) }  )
AddDownItem( mJanM3d, "MsgBox3d&1()", "Demonstra fun‡Æo MsgBox3d1()", { || MsgBox3d1( "Fun‡Æo MsgBox3d1()" ) } )
AddDownItem( mJanM3d, "MsgBox3d&2()", "Demonstra fun‡Æo MsgBox3d2()", { || MsgBox3d2( "Fun‡Æo MsgBox3d2()" ) } )
AddDownItem( mJanM3d, "MsgBox3d&3()", "Demonstra fun‡Æo MsgBox3d3()", { || MsgBox3d3( "Fun‡Æo MsgBox3d3()" ) } )

// mJanFrm - Defini‡Æo dos itens (sub-menu de mJan)
//           O c¢digo necess rio est  no code-block

AddDownItem( mJanFrm, "Estilo &1", "T¡tulo … esquerda / Baixo relevo" , { || aEnv := SavEnv( 02, 00, 23, 79 ), Clrted(), Frame( 05, 05, 16, 74, "T¡tulo" ), WaitState(), RstEnv( aEnv ) } )
AddDownItem( mJanFrm, "Estilo &2", "T¡tulo centralizado / Alto relevo", { || aEnv := SavEnv( 02, 00, 23, 79 ), Clrted(), Frame( 05, 05, 16, 74, "T¡tulo", 2, 2 ), WaitState(), RstEnv( aEnv ) } )
AddDownItem( mJanFrm, "Estilo &3", "T¡tulo … direita / Normal"        , { || aEnv := SavEnv( 02, 00, 23, 79 ), Clrted(), Frame( 05, 05, 16, 74, "T¡tulo", 3, 3 ), WaitState(), RstEnv( aEnv ) } )

// mJanDsk - Defini‡Æo dos itens (sub-menu de mJan)
//           O c¢digo necess rio est  no code-block

AddDownItem( mJanDsk, "Estilo &1", "DeskBox() em baixo relevo" , { || aEnv := SavEnv( 02, 00, 23, 79 ), Clrted(), DeskBox( 05, 05, 16, 74, 1 ), WaitState(), RstEnv( aEnv ) } )
AddDownItem( mJanDsk, "Estilo &2", "DeskBox() em alto relevo"  , { || aEnv := SavEnv( 02, 00, 23, 79 ), Clrted(), DeskBox( 05, 05, 16, 74, 2 ), WaitState(), RstEnv( aEnv ) } )

// mDiv - Definicao dos itens (sub-menu de mBar)

AddDownItem( mDiv, "&Mouse/GET" , "Mouse no sistema GET padrÆo do Clipper", { || MouseGet() } )
AddDownItem( mDiv, "&TBrowse"   , "TBrowse com uso de Mouse na Visual Lib", { || VLTBrow() } )
AddDownItem( mDiv, "&Sombra..." , "Efeito de sombra da Visual Lib"       , { || TesteSombra() } )

while .t.           // Loop principal

   BarMenu( mBar )  //VL-Ap¢s a definicao dos menus, BarMenu( mBar ) controla tudo

   set key K_F10 to // Desligamos set key
   SetKeyMouse( K_F10, {} ) //VL-Desativamos o Mouse para F10

   VLExit()         //VL-Pede confirmacao para sair

   set key K_F10 to saida // Se chegou aqui, significa que nao saiu...
   SetKeyMouse( K_F10, { 24, 24, 72, 79 } ) //VL-Define novamente F10 p/ mouse

end

return nil
////////////////////////////////////////

function Help

local aKM := SetKeyMouse( K_F1, {} ) //VL-Salvamos e desativamos F1 p/ mouse
set key K_F1 to

// Observe que a mensagem passada para MsgBox3d1() e um array com 6 elementos.
// Cada elemento representa uma linha na janela de mensagem que sera exibida

MsgBox3D1(  {   "Analyze Tecnologia em Sistemas Ltda.",;
                "",;
                "Rua Tiradentes, 676 - Centro",;
                "CEP: 13600-000 Araras (SP)",;
                "",;
                "PABX/FAX: (019) 541-6760",;
                "",;
                "Web Site: http://www.analyze.com.br",;
                "E-mail: analyze@analyze.com.br"   },;
                "Sobre o Demo da Visual Lib" ) // segundo parametro (titulo)

set key K_F1 to help
SetKeyMouse( K_F1, aKM ) //VL-Reativamos F1 para o mouse
return nil
///////////////////////////////////////

function saida

local aKM := SetKeyMouse( K_F10, {} ) //VL-Salvamos e desativamos F10 p/ mouse
set key K_F10 to

VLExit()        //VL-Sa¡da da Visual Lib

set key K_F10 to saida
SetKeyMouse( K_F10, aKM ) //VL-Reativamos F10 para o mouse

return nil
///////////////////////////////////////

function MouseGet

local nCod:=0          , cCli:=space(40), cTip:=space(01), cEnd:=space(40)
local cBai := space(20), cCep:=space(10), cCid:=space(40), cEst:=space(02)
local cFon := space(40), cFax:=space(40), cCon:=space(40), cCar:=space(40)
local cCgc := space(20), cIes:=space(20)

LOCAL nButton := 1
LOCAL nOpcao := 0
LOCAL aEnv := savenv( 01, 00, 23, 79 ) //VL-Salva o ambiente

// Aten‡Æo! Estamos simulando a saida do GET e o CLICK no botao!
// Vocˆ pode utilizar esta t‚cnica, mas tome cuidado: se durante
// o comando VLREAD vocˆ chamar outra tecla de fun‡Æo, Ex: F1, nÆo
// desativar SH_F9 a SH_F10 e der um click nos botäes, poderemos
// ter resultados indesej veis. Recomendamos, por medida de seguran‡a,
// caso deseje utilizar esta t‚cnica, desativar no in¡cio e ativar no
// final de qualquer fun‡Æo atribu¡da em SETKEY() as teclas SH_F9 em
// diante, ou outras que desejar.

SETKEY( K_SH_F9  , { || nButton := 1, VLKeyboard( CHR( K_ESC ) + CHR( K_ENTER) ) } )
SETKEY( K_SH_F10 , { || nButton := 2, VLKeyboard( CHR( K_ESC ) + CHR( K_ENTER) ) } )
SETKEY( K_SH_F11 , { || nButton := 3, VLKeyboard( CHR( K_ESC ) + CHR( K_ENTER) ) } )
SETKEY( K_SH_F12 , { || nButton := 4, VLKeyboard( CHR( K_ESC ) + CHR( K_ENTER) ) } )

SetKeyMouse( K_SH_F9 , { 21, 21, 01, 18 } ) //VL-Em complemento a obs anterior,
SetKeyMouse( K_SH_F10, { 21, 21, 21, 38 } ) //   essas sÆo as coordenadas de
SetKeyMouse( K_SH_F11, { 21, 21, 41, 58 } ) //   cada botÆo da fun‡Æo
SetKeyMouse( K_SH_F12, { 21, 21, 61, 78 } ) //   LinButton4()

Clrted()
SETCOLOR( "N+/W,N*/W, , , N*/W" )
SETCURSOR( 1 )

Linbutton4( LB_SHOW )   //VL-Apenas mostramos os botäes

Frame( 02, 01, 06, 78, "Cliente" )              //VL-Desenha moldura
Frame( 07, 01, 19, 78, "Dados Cadastrais" )     

@ 03, 04 say "  C¢digo:" get nCod picture "999999" when DwnMsg( "Informe o c¢digo do cliente" )
@ 04, 04 say " Cliente:" get cCli picture "@!X" when DwnMsg( "Informe o nome do cliente" )
@ 05, 04 say "    Tipo:" get cTip picture "@!A" when DwnMsg( "Informe o tipo de pessoa: [F] F¡sica [J] Jur¡dica" )

@ 08, 04 say "Endere‡o:" get cEnd picture "@!X" when DwnMsg( "Informe o endere‡o do cliente" )
@ 09, 04 say "  Bairro:" get cBai picture "@!X" when DwnMsg( "Informe o bairro" )
@ 10, 04 say "     CEP:" get cCep picture "99.999-999" when DwnMsg( "Informe o CEP" )
@ 11, 04 say "  Cidade:" get cCid picture "@!X" when DwnMsg( "Informe a cidade" )
@ 12, 04 say "  Estado:" get cEst picture "@!X" when DwnMsg( "Informe o estado" )
@ 13, 04 say "    Fone:" get cFon picture "@!X" when DwnMsg( "Informe o telefone do cliente" )
@ 14, 04 say "     Fax:" get cFax picture "@!X" when DwnMsg( "Informe o fax do cliente" )
@ 15, 04 say " Contato:" get cCon picture "@!X" when DwnMsg( "Informe o contato na empresa" )
@ 16, 04 say "   Cargo:" get cCar picture "@!X" when DwnMsg( "Informe o cargo" )
@ 17, 04 say " CGC/CPF:" get cCgc picture "@!X" when DwnMsg( "Informe o CGC ou CPF do cliente" )
@ 18, 04 say "   IE/RG:" get cIes picture "@!X" when DwnMsg( "Informe a Inscri‡Æo Estadual ou o RG do cliente" )

VLREAD  //VL-O comando VLREAD faz todo o trabalho. Seu mouse j  funciona!

SET KEY K_SH_F9 TO      // Veja observa‡Æo acima
SET KEY K_SH_F10 TO     // Vocˆ nÆo pode esquecer
SET KEY K_SH_F11 TO     // de desativar as teclas
SET KEY K_SH_F12 TO     // de fun‡Æo

SetKeyMouse( K_SH_F9 , {} )     // E tamb‚m nÆo pode esquecer
SetKeyMouse( K_SH_F10, {} )     // de inibir o uso do mouse
SetKeyMouse( K_SH_F11, {} )     // para elas
SetKeyMouse( K_SH_F12, {} )

nOpcao := Linbutton4( LB_PROC, NB_GRAY, , nButton )       //VL-Processa botäes

MsgBox1( "Vocˆ escolheu o botÆo: " + STR( nOpcao, 1, 0 ), "Mouse/GET", 7 )

RstEnv( aEnv )
RETURN NIL
///////////////////////////////////////

function TesteSombra

//Win() desenha janela nas coordenadas especificadas
local aEnv := Win( 05, 02, 19, 77, "Paleta de Cores", WT_AZUL2BRANCO, WD_AZUL2BRANCO )

setcolor( "N/N" )     ; @ 07, 04 clear to 18, 07
setcolor( "B/B" )     ; @ 07, 08 clear to 18, 11
setcolor( "G/G" )     ; @ 07, 12 clear to 18, 15
setcolor( "BG/BG" )   ; @ 07, 16 clear to 18, 19
setcolor( "R/R" )     ; @ 07, 20 clear to 18, 23
setcolor( "RB/RB" )   ; @ 07, 24 clear to 18, 27
setcolor( "GR/GR" )   ; @ 07, 28 clear to 18, 31
setcolor( "W/W" )     ; @ 07, 32 clear to 18, 35
setcolor( "N+*/N" )   ; @ 07, 36 clear to 18, 39
setcolor( "B+*/B" )   ; @ 07, 40 clear to 18, 43
setcolor( "G+*/G" )   ; @ 07, 44 clear to 18, 47
setcolor( "BG+*/BG" ) ; @ 07, 48 clear to 18, 51
setcolor( "R+*/R" )   ; @ 07, 52 clear to 18, 55
setcolor( "RB+*/RB" ) ; @ 07, 56 clear to 18, 59
setcolor( "GR+*/GR" ) ; @ 07, 60 clear to 18, 63
setcolor( "W+*/W" )   ; @ 07, 64 clear to 18, 67

setcolor( "N/N" )     ; @ 07, 68 clear to 18, 71
setcolor( "B/B" )     ; @ 07, 72 clear to 18, 75

win( 09, 17, 15, 63, "Teste da Sombra" )
setcolor( "N*/W" )

@ 11, 27 say "Veja como o efeito de sombra"
@ 12, 27 say "da Visual Lib se aproxima do"
@ 13, 27 say "    padrÆo real das cores."

WaitState()     //VL-Aqui, apenas esperamos uma tecla ou um click do mouse

RstEnv( aEnv )
return nil
///////////////////////////////////////

function VLTBrow

LOCAL aEnv  := SavEnv( 0, 0, 24, 79 )

LOCAL oTbr  := TBrowseDB( 04, 04, 19, 74 )
LOCAL oTbc1 := TBColumnNew( "Cliente", { || nome } )
LOCAL oTbc2 := TBColumnNew( "CEP"    , { || cep  } )

LOCAL aWst
LOCAL lExt
LOCAL nInd, nLin, nCol, nTbrLin, nTbrCol

USE CLIENTES ALIAS CLI NEW

oTbr:colSep := " ³ "
oTbr:headSep := "Ä"
oTbr:colorSpec := "N*/W,W+/B,R*/W,W+/R"

oTbr:addColumn( oTbc1 )
oTbr:addColumn( oTbc2 )

Win( 03, 03, 20, 75, "Clientes: " + STR( CLI->( LASTREC() ), 4, 0 ) )
SETCOLOR( "N*/W,W+/B" )

@ 23, 00 SAY PADL( "[Esc] Sa¡da ", 80 ) COLOR "R*/W"    // sair pelo mouse
@ 23, 01 SAY "[PgUp]" COLOR "R*/W"                      // PgUp pelo mouse
@ 23, 08 SAY "[PgDn]" COLOR "R*/W"                      // PgDn pelo mouse
@ 23, 16 SAY "[" + CHR( 24 ) + "]" COLOR "R*/W"         // Sobe pelo mouse
@ 23, 20 SAY "[" + CHR( 25 ) + "]" COLOR "R*/W"         // Desce pelo mouse
@ 23, 24 SAY "[" + CHR( 27 ) + "]" COLOR "R*/W"         // Esq. pelo mouse
@ 23, 28 SAY "[" + CHR( 26 ) + "]" COLOR "R*/W"         // Dir. pelo mouse

lExt := .F.

WHILE !lExt

   VLMouseOff()
   WHILE !oTbr:stabilize() ; END
   VLMouseOn()

   aWSt := WaitState()          // substitui o INKEY()
   
   DO CASE
      CASE aWSt:wsType == WAIT_KEYPRESS // o evento foi uma tecla
         
      DO CASE                           // manipula‡Æo padrÆo de teclas
        CASE aWst:wsKey == K_DOWN          ; oTbr:down()
        CASE aWst:wsKey == K_UP            ; oTbr:up()
        CASE aWst:wsKey == K_PGDN          ; oTbr:pageDown()
        CASE aWst:wsKey == K_PGUP          ; oTbr:pageUp()
        CASE aWst:wsKey == K_CTRL_PGUP     ; oTbr:goTop()
        CASE aWst:wsKey == K_CTRL_PGDN     ; oTbr:goBottom()
        CASE aWst:wsKey == K_RIGHT         ; oTbr:right()
        CASE aWst:wsKey == K_LEFT          ; oTbr:left()
        CASE aWst:wsKey == K_HOME          ; oTbr:home()
        CASE aWst:wsKey == K_END           ; oTbr:end()
        CASE aWst:wsKey == K_CTRL_LEFT     ; oTbr:panLeft()
        CASE aWst:wsKey == K_CTRL_RIGHT    ; oTbr:panRight()
        CASE aWst:wsKey == K_CTRL_HOME     ; oTbr:panHome()
        CASE aWst:wsKey == K_CTRL_END      ; oTbr:panEnd()
        CASE aWst:wsKey == K_ESC           ; lExt := .T.
      ENDCASE

      // abaixo - evento MOUSEDOWN - o usu rio clicou com o mouse

      CASE aWst:wsType == WAIT_MOUSEDOWN .AND. aWst:wsRow == 23 // na linha 23

         IF     aWst:wsCol >= 68 .AND. aWst:wsCol <= 78 // clicou em "[Esc] Sa¡da"
            lExt := .T.
         ELSEIF aWst:wsCol >= 01 .AND. aWst:wsCol <= 06 // clicou em "[PgUp]"
            oTbr:pageUp()
         ELSEIF aWst:wsCol >= 08 .AND. aWst:wsCol <= 13 // clicou em "[PgDn]"
            oTbr:pageDown()
         ELSEIF aWst:wsCol >= 16 .AND. aWst:wsCol <= 18 // clicou em "Sobe"
            oTbr:up()
         ELSEIF aWst:wsCol >= 20 .AND. aWst:wsCol <= 22 // clicou em "Desce"
            oTbr:down()
         ELSEIF aWst:wsCol >= 24 .AND. aWst:wsCol <= 26 // clicou em "Esquerda"
            oTbr:left()
         ELSEIF aWst:wsCol >= 28 .AND. aWst:wsCol <= 30 // clicou em "Direita"
            oTbr:right()
         ENDIF
      
      CASE aWSt:wsType == WAIT_MOUSEDOWN .AND.; // c¢digo para habilitar cliques nas c‚lulas do tbrowse
           aWSt:wsRow >= 6 .AND. aWSt:wsRow <= 20 .AND.;
           aWSt:wsCol >= 3 .AND. aWSt:wsCol <= 75
         nLin := aWSt:wsRow
         nCol := aWSt:wsCol
         nTbrLin := oTbr:rowPos
         nTbrCol := oTbr:colPos
         oTbr:deHilite()
         oTbr:rowPos := nTbrLin + nLin - ROW()  // Acerta linha
         
         VLMouseOff()
         FOR nInd = oTbr:rightVisible TO oTbr:leftVisible STEP -1
            oTbr:colPos := nInd
            oTbr:Hilite()
            IF COL() - 1 <= nCol
               oTbr:Hilite()
               EXIT
            ENDIF
         NEXT
         IF nTbrLin == oTbr:rowPos .AND. nTbrCol == oTbr:colPos // clicou 2X na mesma c‚lula
            VLMouseOn()
            MsgBox1( "Clique duplo..." ) // aqui vocˆ pode colocar seu c¢digo...
            VLMouseOff()
         ENDIF
         oTbr:refreshCurrent()
         VLMouseOn()
   
   ENDCASE
END

Rstenv( aEnv )
CLI->( DBCLOSEAREA() )

return nil
///////////////////////////////////////
