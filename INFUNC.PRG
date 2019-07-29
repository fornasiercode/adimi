//////////////////////////////////////////////////////////////////////////////
//                           ADIMI-2000                                     //
//                                                                          //
// VERS∆O 1.0                                                               //
// CRIADO POR: Leonardo Brum Fornasier                                      //
// INFUNC.PRG                                                               //
// OBJETIVO:Fazer a inclus∆o de funcionarios na Banco de Dados              //
//////////////////////////////////////////////////////////////////////////////
////SET'S/////////////////////////////////////////////////////////////////////
set date british
set score off
set century on
set confirm off
set delimiters on
set delimiters to "[]"
set intensity off
//////////////////////////////////////////////////////////////////////////////

////VARIAVEIS/////////////////////////////////////////////////////////////////
store space(40) to nomefunc
store space(23) to cidafunc,endefunc
store space(20) to paifunc
store space(16) to maefunc,baifunc
store space(02) to uffunc
store space(01) to civifunc
store 0 to codfunc,telefunc,cepfunc,cntfunc,numfilhos,idenfunc,cpffunc,eleifunc
store 0 to milifunc
datafunc=ctod(space(08))
//////////////////////////////////////////////////////////////////////////////
sele 1
use func.dbf 
////PRENCHIMENTO DO BANCO DE  DADOS///////////////////////////////////////////

do while .t.

go bottom
codfunc=codigo+1

@ 03,21 say codfunc 

@ 04,21 get nomefunc pict "@!"
@ 05,21 get paifunc pict "@!"
@ 05,52 get maefunc pict "@!"
@ 06,21 get datafunc
@ 06,59 get numfilhos pict "99"
@ 07,21 get telefunc pict  "(99)999-99-99"
@ 08,21 get civifunc pict "@!a";
valid civifunc="C" .or. civifunc="S"
@ 09,21 get idenfunc pict "999999999999"
@ 10,21 get cpffunc pict "999,999,999-99"
@ 11,21 get cntfunc pict "99999999"
@ 12,21 get milifunc pict "99999999"
@ 13,21 get eleifunc pict "999999999/99"
@ 14,21 get endefunc pict "@!"
@ 14,55 get baifunc pict "@!"
@ 15,21 get cidafunc pict "@!"
@ 15,51 get uffunc pict "@!"
@ 16,21 get cepfunc pict "99,999,999"
read


if lastkey()=27
x=alert ("Abortar Operaá∆o",{"Sim","N∆o"})
        if x=1
        set intensity on

        @ 03,21 clear to 16,45
        @ 04,21 clear to 04,73
        @ 05,52 clear to 05,73
        @ 06,59 clear to 06,73
        @ 14,55 clear to 14,73
        @ 15,51 clear to 15,73

        store space(40) to nomefunc
        store space(23) to cidafunc,endefunc
        store space(20) to paifunc
        store space(16) to maefunc,baifunc
        store space(02) to uffunc
        store space(01) to civifunc
        store 0 to codfunc,telefunc,cepfunc,cntfunc,numfilhos,idenfunc,cpffunc,eleifunc
        store 0 to milifunc
        datafunc=ctod(space(08))


        close databases
        return
        endif


        if x=2
        loop
        endif
endif


      x=alert("Confirmar Digitaá∆o",{"Sim","N∆o"})

                if x=1
                /////entrada do banco
                append blank
                replace codigo with codfunc
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
                
                     a=alert("Continuar Incluindo",{"Sim","N∆o"})
                         if a=1
                         store space(40) to nomefunc
                         store space(23) to cidafunc,endefunc
                         store space(20) to paifunc
                         store space(16) to maefunc,baifunc
                         store space(02) to uffunc
                         store space(01) to civifunc
                         store 0 to codfunc,telefunc,cepfunc,cntfunc,numfilhos,idenfunc,cpffunc,eleifunc
                         store 0 to milifunc
                         datafunc=ctod(space(08))
        
                         @ 03,21 clear to 16,45
                         @ 04,21 clear to 04,73
                         @ 05,52 clear to 05,73
                         @ 06,59 clear to 06,73
                         @ 14,55 clear to 14,73
                         @ 15,51 clear to 15,73

                         loop
                         endif

                         if a=2
                         set intensity on

                         store space(40) to nomefunc
                         store space(23) to cidafunc,endefunc
                         store space(20) to paifunc
                         store space(16) to maefunc,baifunc
                         store space(02) to uffunc
                         store space(01) to civifunc
                         store 0 to codfunc,telefunc,cepfunc,cntfunc,numfilhos,idenfunc,cpffunc,eleifunc
                         store 0 to milifunc
                         datafunc=ctod(space(08))


                 
                         @ 03,21 clear to 16,45
                         @ 04,21 clear to 04,73
                         @ 05,52 clear to 05,73
                         @ 06,59 clear to 06,73
                         @ 14,55 clear to 14,73
                         @ 15,51 clear to 15,73
                         close databases
                         return
                         endif
  
                endif
   
                if x=2
                loop
                endif


enddo

close databases
return
