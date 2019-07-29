//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// EXFUNC.PRG                                                               //
// OBJETIVO:Fazer a exclus∆o de funcionarios no Banco de Dados              //
//////////////////////////////////////////////////////////////////////////////
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set bell on
set intensity off

//////////////////////////////////////////////////////////////////////////////
////VARIAVEIS/////////////////////////////////////////////////////////////////
store space(40) to nomefunc
store space(24) to cidafunc,endefunc
store space(20) to paifunc
store space(16) to maefunc,baifunc
store space(10) to civifunc,uffunc
store 0 to codfunc,telefunc,cepfunc,cntfunc,numfilhos,idenfunc,cpffunc,eleifunc
store 0 to milifunc
datafunc=ctod(space(08))
//////////////////////////////////////////////////////////////////////////////
sele 1
use func.dbf 
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.
@ 03,21 get codfunc
read

    if lastkey()=27
    x=alert ("Abortar Operas∆o",{"Sim","N∆o"})

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



locate for codigo=codfunc

if found()
@ 04,21 say alltrim(nome)pict "@!"
@ 05,21 say alltrim(pai) pict "@!"
@ 05,52 say alltrim(mae) pict "@!"
@ 06,21 say nascimento
@ 06,59 say filhos pict "99"
@ 07,21 say telefone pict  "(99)999-99-99"
@ 08,21 say alltrim(civil) pict "@!"
@ 09,21 say identidade pict "999999999999"
@ 10,21 say cpf pict "999,999,999-99"
@ 11,21 say cnt pict "99999999"
@ 12,21 say militar pict "99999999"
@ 13,21 say eleitor pict "999999999/99"
@ 14,21 say alltrim(endereco) pict "@!"
@ 14,55 say alltrim(bairro) pict "@!"
@ 15,21 say alltrim(cidade) pict "@!"
@ 15,51 say alltrim(uf) pict "@!"
@ 16,21 say cep pict "99,999,999"
wait""
else
store 0 to codfunc
alert ("Registro n∆o encontrado !")
loop
endif

           a=alert ("Tem serteza que deseja excluir o registro ?",{"Sim","N∆o"})
           if a=1
           nomefunc=nome
           paifunc=pai
           maefunc=mae
           datafunc=nascimento
           numfilhos=filhos
           telefunc=telefone
           civifunc=civil
           idenfunc=identidade
           cpffunc=cpf
           cntfunc=cnt
           milifunc=militar
           eleifunc=eleitor
           endefunc=endereco
           baifunc=bairro
           cidafunc=cidade
           uffunc=uf
           cepfunc=cep

           store space(40) to nomefunc
           store space(24) to cidafunc,endefunc
           store space(20) to paifunc
           store space(16) to maefunc,baifunc
           store space(10) to civifunc,uffunc
           store 0 to telefunc,cepfunc,cntfunc,numfilhos,idenfunc,cpffunc,eleifunc
           store 0 to milifunc
           datafunc=ctod(space(08))

                replace nome with nomefunc
                replace pai with paifunc
                replace mae with maefunc
                replace nascimento with datafunc
                replace filhos with numfilhos
                replace telefone with telefunc
                replace civil with civifunc
                replace identidade with idenfunc
                replace cpf with cpffunc
                replace cnt with cntfunc
                replace militar with milifunc
                replace eleitor with eleifunc
                replace endereco with endefunc
                replace bairro with baifunc
                replace cidade with cidafunc
                replace uf with uffunc
                replace cep with cepfunc
                commit

           
           @ 03,21 clear to 16,45
           @ 04,21 clear to 04,73
           @ 05,52 clear to 05,73
           @ 06,59 clear to 06,73
           @ 14,55 clear to 14,73
           @ 15,51 clear to 15,73
           store 0 to codfunc
           endif

           if a=2
           @ 03,21 clear to 16,45
           @ 04,21 clear to 04,73
           @ 05,52 clear to 05,73
           @ 06,59 clear to 06,73
           @ 14,55 clear to 14,73
           @ 15,51 clear to 15,73
           store 0 to codfunc
           loop
           endif

enddo


