SELECT  * FROM tabela_de_produtos
WHERE SABOR = 'manga' OR TAMANHO = '470 ml';

SELECT  * FROM tabela_de_produtos
WHERE SABOR = 'manga' AND TAMANHO = '470 ml';

SELECT  * FROM tabela_de_produtos
WHERE NOT (SABOR = 'manga' AND TAMANHO = '470 ml');

SELECT  * FROM tabela_de_produtos
WHERE SABOR IN ('laranja', 'manga');

SELECT * FROM tabela_de_clientes
WHERE CIDADE IN ('Rio de janeiro', 'São Paulo') AND (IDADE >= 20 AND IDADE <= 24);
