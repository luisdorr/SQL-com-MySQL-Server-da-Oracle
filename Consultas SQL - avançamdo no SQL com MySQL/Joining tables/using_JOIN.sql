SELECT * FROM  tabela_de_vendedores;
SELECT * FROM  notas_fiscais;

SELECT * FROM tabela_de_vendedores vendedores
INNER JOIN  notas_fiscais notas
ON vendedores.MATRICULA = notas.MATRICULA;


SELECT vendedores.MATRICULA, vendedores.NOME, COUNT(*)
FROM tabela_de_vendedores vendedores
INNER JOIN  notas_fiscais notas
ON vendedores.MATRICULA = notas.MATRICULA
GROUP BY vendedores.MATRICULA, vendedores.NOME;

# Without Join
SELECT vendedores.MATRICULA, vendedores.NOME, COUNT(*)
FROM tabela_de_vendedores vendedores, notas_fiscais notas
WHERE vendedores.MATRICULA = notas.MATRICULA
GROUP BY vendedores.MATRICULA, vendedores.NOME;


SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY YEAR(DATA_VENDA)


