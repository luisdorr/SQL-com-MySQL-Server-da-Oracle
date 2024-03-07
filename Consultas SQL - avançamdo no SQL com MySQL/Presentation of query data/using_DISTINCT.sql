SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos
WHERE SABOR = 'laranja';

SELECT DISTINCT tabela_de_clientes.BAIRRO FROM tabela_de_clientes
WHERE CIDADE = 'Rio de janeiro';