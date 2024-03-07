USE sucos_vendas;

# Normal
SELECT
    CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO,
    IDADE, SEXO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA
FROM tabela_de_clientes;

# All Columns
SELECT * FROM tabela_de_clientes;

# Alias
SELECT CPF as ID, NOME as CUSTOMER FROM tabela_de_clientes;

# Filters
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Laranja';

# In MySQL, capital letters have no influence
SELECT * FROM tabela_de_produtos WHERE EMBALAGEM = 'PET';
SELECT * FROM tabela_de_produtos WHERE EMBALAGEM = 'pet';

# comparing
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA > 19.50;
SELECT * FROM tabela_de_produtos WHERE PRECO_DE_LISTA BETWEEN 19.50 AND 19.52;