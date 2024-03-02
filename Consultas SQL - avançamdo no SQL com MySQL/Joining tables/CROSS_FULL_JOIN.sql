SELECT * FROM tabela_de_vendedores;
SELECT * FROM tabela_de_clientes;

SELECT * FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO,
       tabela_de_vendedores.NOME, DE_FERIAS,
       tabela_de_clientes.BAIRRO,
       tabela_de_clientes.NOME
FROM tabela_de_vendedores
INNER JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

SELECT tabela_de_vendedores.BAIRRO,
       tabela_de_vendedores.NOME, DE_FERIAS,
       tabela_de_clientes.BAIRRO,
       tabela_de_clientes.NOME
FROM tabela_de_vendedores
LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

# CROSS JOIN
SELECT tabela_de_vendedores.BAIRRO,
       tabela_de_vendedores.NOME, DE_FERIAS,
       tabela_de_clientes.BAIRRO,
       tabela_de_clientes.NOME
FROM tabela_de_vendedores, tabela_de_clientes;

# MySQL does not support FULL JOIN, to use that, we have to use the
# RIGHT and LEFT JOIN in the same time
SELECT tabela_de_vendedores.BAIRRO,
       tabela_de_vendedores.NOME, DE_FERIAS,
       tabela_de_clientes.BAIRRO,
       tabela_de_clientes.NOME
FROM tabela_de_vendedores
FULL JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

# To OverPass this issue, we can use the UNION. For Example:
SELECT tabela_de_vendedores.BAIRRO,
       tabela_de_vendedores.NOME, DE_FERIAS,
       tabela_de_clientes.BAIRRO,
       tabela_de_clientes.NOME
FROM tabela_de_vendedores
LEFT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION # <------ Here goes the UNION, between both queries.
SELECT tabela_de_vendedores.BAIRRO,
       tabela_de_vendedores.NOME, DE_FERIAS,
       tabela_de_clientes.BAIRRO,
       tabela_de_clientes.NOME
FROM tabela_de_vendedores
RIGHT JOIN tabela_de_clientes
ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;