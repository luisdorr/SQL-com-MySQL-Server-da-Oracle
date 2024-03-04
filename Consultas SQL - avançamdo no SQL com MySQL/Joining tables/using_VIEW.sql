# A view in MySQL is a named query that acts as a virtual table. You can create a view
# from one or more tables, or even from another view. A view does not store any data,
# but only the definition of the query. When you query data from a view, MySQL executes
# the underlying query and returns the result set.

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS BIGGEST_PRICE FROM tabela_de_produtos
GROUP BY EMBALAGEM;

SELECT X.EMBALAGEM, X.BIGGEST_PRICE
FROM
    (SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS BIGGEST_PRICE FROM tabela_de_produtos
     GROUP BY EMBALAGEM) X
WHERE X.BIGGEST_PRICE >= 10;

# CREATING A VIEW
USE 'sucos_vendas';
CREATE VIEW 'VW_LARGEST_PACKAGES' AS
    SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS BIGGEST_PRICE FROM tabela_de_produtos
    GROUP BY EMBALAGEM;

# Using it
SELECT VIEW.EMBALAGEM, VIEW.BIGGEST_PRICE
FROM VW_LARGEST_PACKAGES VIEW
WHERE VIEW.BIGGEST_PRICE >= 10;

SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, VW.BIGGEST_PRICE,
       (A.PRECO_DE_LISTA / VW.BIGGEST_PRICE-1) * 100 AS percentual
FROM tabela_de_produtos A
INNER JOIN vw_largest_packages VW
ON A.EMBALAGEM = VW.EMBALAGEM;