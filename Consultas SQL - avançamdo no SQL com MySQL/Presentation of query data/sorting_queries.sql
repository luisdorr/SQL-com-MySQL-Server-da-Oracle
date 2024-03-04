SELECT  * FROM tabela_de_produtos;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC ;

# That's redundant, but possible
SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA ASC ;

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC, EMBALAGEM ASC;