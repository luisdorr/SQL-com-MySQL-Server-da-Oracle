# What are sub-queries?
# They are queries inside a query. >;)

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

SELECT * FROM tabela_de_clientes
WHERE BAIRRO IN ('TIJUCA', 'JARDINS', 'COPACABAMA', 'SANTO AMARO');
# Other way to write the same thing, is using a sub-query.
SELECT * FROM tabela_de_clientes
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);


SELECT EMBALAGEM, MAX(PRECO_DE_LISTA)
FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT SUB_QUERY.EMBALAGEM, SUB_QUERY.PRECO_MAXIMO
FROM (SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO
      FROM tabela_de_produtos
      GROUP BY EMBALAGEM) SUB_QUERY
WHERE SUB_QUERY.PRECO_MAXIMO >= 10;


# Exercise, pass this to a sub-query
SELECT CPF, COUNT(*) FROM notas_fiscais
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY CPF
HAVING COUNT(*) > 2000;

# Result
SELECT CPF, NUMBER_OF_SALES
FROM
    (SELECT CPF, COUNT(*) AS NUMBER_OF_SALES
     FROM notas_fiscais
     WHERE YEAR(DATA_VENDA) = 2016
     GROUP BY CPF) X
WHERE X.NUMBER_OF_SALES >= 2000;
