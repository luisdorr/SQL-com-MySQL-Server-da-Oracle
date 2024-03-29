USE `sucos_vendas`;
DROP procedure IF EXISTS `inclui_novo_produto_parametro`;
DELIMITER $$

USE `sucos_vendas`$$
CREATE PROCEDURE `inclui_novo_produto_parametro`(vCodigo varchar(50),
vNome varchar(50), vSabor varchar(50), vTamanho varchar(50),
vEmbalagem varchar(50), vPreco DECIMAL(10,2))
BEGIN
INSERT INTO tabela_de_produtos
(CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
     VALUES (vCodigo,
     vNome,
     vSabor,
     vTamanho,
     vEmbalagem,
     vPreco);
END$$
DELIMITER ;

Call inclui_novo_produto_parametro('4000001', 'Sabor do Pantanal 1 Litro - Melancia',
'Melancia', '1 Litro', 'PET', 4.76);

SELECt * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '4000001';