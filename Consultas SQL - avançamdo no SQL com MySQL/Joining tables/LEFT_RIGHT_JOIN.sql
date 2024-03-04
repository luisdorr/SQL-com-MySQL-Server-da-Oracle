SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF, COUNT(*) FROM notas_fiscais
GROUP BY CPF;

SELECT DISTINCT clientes.CPF, clientes.NOME, notas.CPF
FROM tabela_de_clientes clientes
INNER JOIN notas_fiscais notas
ON clientes.CPF = notas.CPF;

SELECT DISTINCT clientes.CPF, clientes.NOME, notas.CPF
FROM tabela_de_clientes clientes
LEFT JOIN notas_fiscais notas
ON clientes.CPF = notas.CPF
WHERE notas.CPF IS NULL;

SELECT DISTINCT clientes.CPF, clientes.NOME, notas.CPF
FROM tabela_de_clientes clientes
RIGHT JOIN notas_fiscais notas
ON clientes.CPF = notas.CPF
WHERE clientes.CPF IS NULL AND YEAR(notas.DATA_VENDA) = 2015;