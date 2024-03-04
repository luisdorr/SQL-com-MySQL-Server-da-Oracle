SELECT * FROM itens_notas_fiscais;
SELECT * FROM  notas_fiscais;

SELECT CPF, DATA_VENDA, QUANTIDADE FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO;

SELECT CPF, DATA_VENDA, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MOUNTH_YEAR
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO;

/*
    CUSTOMER SALES ENQUIRY BY MONTH
 */
SELECT CPF, DATA_VENDA, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MOUNTH_YEAR,
       SUM(INF.QUANTIDADE) AS SALES_AMOUNT
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF
ON NF.NUMERO = INF.NUMERO
GROUP BY  NF.CPF, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m');


# PURCHASE LIMIT PER CUSTOMER
SELECT * FROM tabela_de_clientes TC;
SELECT TC.CPF, TC.NOME, TC.VOLUME_DE_COMPRA AS LIMIT_AMOUNT
FROM tabela_de_clientes TC;

SELECT SQ.CPF, SQ.NOME, SQ.MOUNTH_YEAR, SQ.SALES_AMOUNT, SQ.LIMIT_AMOUNT,
       (SQ.LIMIT_AMOUNT - SQ.SALES_AMOUNT) AS DIFF
FROM(
    SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MOUNTH_YEAR,
       SUM(INF.QUANTIDADE) AS SALES_AMOUNT,
       TC.VOLUME_DE_COMPRA AS LIMIT_AMOUNT
    FROM notas_fiscais NF
    INNER JOIN itens_notas_fiscais INF
    ON NF.NUMERO = INF.NUMERO
    INNER JOIN tabela_de_clientes TC
    ON NF.CPF = TC.CPF
    GROUP BY  NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')
    ) SQ;


SELECT SQ.CPF, SQ.NOME, SQ.MOUNTH_YEAR, SQ.SALES_AMOUNT, SQ.LIMIT_AMOUNT,
       (SQ.LIMIT_AMOUNT - SQ.SALES_AMOUNT) AS DIFF,
       IF((SQ.LIMIT_AMOUNT - SQ.SALES_AMOUNT) < 0, 'INVALID', 'VALID') AS SALES_STATUS
FROM(
    SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MOUNTH_YEAR,
       SUM(INF.QUANTIDADE) AS SALES_AMOUNT,
       TC.VOLUME_DE_COMPRA AS LIMIT_AMOUNT
    FROM notas_fiscais NF
    INNER JOIN itens_notas_fiscais INF
    ON NF.NUMERO = INF.NUMERO
    INNER JOIN tabela_de_clientes TC
    ON NF.CPF = TC.CPF
    GROUP BY  NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')
    ) SQ;


# FINAL VERSION --------------------------------------------------------------------------
SELECT SQ.CPF, SQ.NOME, SQ.MOUNTH_YEAR, SQ.SALES_AMOUNT, SQ.LIMIT_AMOUNT,
       IF((SQ.LIMIT_AMOUNT - SQ.SALES_AMOUNT) < 0, 'INVALID', 'VALID') AS SALES_STATUS
FROM(
    SELECT NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m') AS MOUNTH_YEAR,
       SUM(INF.QUANTIDADE) AS SALES_AMOUNT,
       TC.VOLUME_DE_COMPRA AS LIMIT_AMOUNT
    FROM notas_fiscais NF
    INNER JOIN itens_notas_fiscais INF
    ON NF.NUMERO = INF.NUMERO
    INNER JOIN tabela_de_clientes TC
    ON NF.CPF = TC.CPF
    GROUP BY  NF.CPF, TC.NOME, DATE_FORMAT(NF.DATA_VENDA, '%Y-%m')
    ) SQ;

