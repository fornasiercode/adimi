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
*

sele 1
use contas.dbf 
*
do while .t.
sele 1
@ 11,30 get cod pict "9999"
read
        if lastkey()=27


        if empty(cod)
        pcontas()
        loop
        endif

seek cod

if found()
@ 12,30 say alltrim(nome)
@ 13,30 say alltrim(arquivo)
@ 14,30 say alltrim(indice)

x=alert("Confirmar Exclus∆o !!!",{"Sim,"N∆o"})
                if x=1
                delete
                pack
                erase
                erase
                endif

                if x=2
                loop
                endif
else
alert("Arquivo Inexistente")
pcontas()
endif

enddo


return

