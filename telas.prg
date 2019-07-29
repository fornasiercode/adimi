************************
* PROCEDURES DE TELAS  *
************************

* TELA CONTA NOVA

procedure tconta_nova
public tconta_nova:=space(30)

set color to /p
@ 10,11 clear to 16,64
*
set color to p/w+,w+/b+
@ 09,10 clear to 15,63
*
@ 09,10 to 15,63
*
@ 10,12 say "Conta.Nova:"
@ 11,12 say "Numero.Conta....:"
@ 12,12 say "Nome.conta......:" 
@ 13,12 say "Arquivo.Conta...:"
@ 14,12 say "Arquivo.Indices.:"
tconta_nova=savescreen(09,10,15,63)
return

* TELA LANÄAMENTO

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
@ 03,30 say "Lanáamento.CONTAS:"
@ 05,30 say "Conta......:"
@ 06,30 say "Data.......:"
@ 07,30 say "Historico..:"
@ 08,30 say "D/C........:"
@ 09,30 say "Valor......:"
@ 10,30 say "Ocorrencia.:"
tlancamento=savescreen(00,00,24,80)

return


* TELA EXLUS«O DE CONTA
procedure tex_conta
public tex_conta:=space(30)

set color to /p
@ 10,11 clear to 16,64
*
set color to p/w+,w+/b+
@ 09,10 clear to 15,63
*
@ 09,10 to 15,63
*
@ 10,12 say "Excluir.Nova:"
@ 11,12 say "Numero.Conta....:"
@ 12,12 say "Nome.conta......:" 
@ 13,12 say "Arquivo.Conta...:"
@ 14,12 say "Arquivo.Indices.:"
tex_conta=savescreen(00,00,24,80)
return

* TELA DE SALDO
procedure tsaldo
public tsaldo:=space(30)

set color to /p
@ 10,11 clear to 16,64
*
set color to p/w+,w+/b+
@ 09,10 clear to 15,63
*
@ 09,10 to 15,63
*
@ 10,12 say "Saldo.Conta"
@ 11,12 say "Numero.Conta....:"
@ 12,12 say "Total.Debitos...:" 
@ 13,12 say "Total.Creditos..:"
@ 14,12 say "Saldo.Conta.....:"
tsaldo=savescreen(00,00,24,80)
return

* TELA INCLUS«O DE CATEGORIAS
procedure tin_categ
public tin_categ:=space(30)

set color to /p
@ 10,03 clear to 16,78
*
set color to p/w+,w+/b+
@ 09,02 clear to 15,77
*
@ 09,02 to 15,39
@ 09,02 to 15,77
*
@ 10,40 say "Inclus∆o.Categorias:"
@ 12,40 say "Nome.Conta...:"
@ 13,40 say "Codigo.......:"
@ 14,40 say "Categoria....:"
tin_categ=savescreen(00,00,24,80)
return

* TELA CONSULTA DE CATEGORIAS
procedure tcon_categ
public tcon_categ:=space(30)
set color to /p
@ 10,03 clear to 16,78
*
set color to p/w+,w+/b+
@ 09,02 clear to 15,77
*
@ 09,02 to 15,39
@ 09,02 to 15,77
*
tcon_categ=savescreen(00,00,24,80)
return
