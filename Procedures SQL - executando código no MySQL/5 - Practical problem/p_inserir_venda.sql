USE `sucos_vendas`;
DROP procedure IF EXISTS `p_inserir_venda`;

USE `sucos_vendas`;
DROP procedure IF EXISTS `sucos_vendas`.`p_inserir_venda`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_inserir_venda`(vData DATE, max_itens INT, max_quantidade INT)
BEGIN
	DECLARE vCliente VARCHAR (11);
    DECLARE vProduto VARCHAR (10);
    DECLARE vVendedor VARCHAR (5);
    DECLARE vQuantidade INT;
    DECLARE vPreco FLOAT;
    DECLARE vItens INT;
    DECLARE vNumero_nota INT;
    DECLARE vContador INT DEFAULT 1;
	DECLARE vNumItensNota INT;

    SELECT MAX(numero) + 1 INTO vNumero_nota FROM notas_fiscais;

    SET vCliente = f_cliente_aleatorio();
    SET vVendedor = f_vendedor_aleatorio();

    INSERT INTO notas_fiscais (CPF, MATRICULA, DATA_VENDA, NUMERO, IMPOSTO)
    VALUES (vCliente, vVendedor, vData, vNumero_nota, 0.18);
    SET vItens = f_numero_aleatorio(1, max_itens);

    WHILE vContador <= vItens
    DO
		SET vProduto = f_produto_aleatorio();
		SELECT COUNT(*) INTO vNumItensNota FROM sucos_vendas.itens_notas_fiscais
        WHERE NUMERO = vNumero_Nota AND CODIGO_DO_PRODUTO = vProduto;
        IF vNumItensNota = 0 THEN
            SET vQuantidade = f_numero_aleatorio(10, max_quantidade);
            SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
            WHERE CODIGO_DO_PRODUTO = vProduto;
            INSERT INTO itens_notas_fiscais (NUMERO, CODIGO_DO_PRODUTO, QUANTIDADE, PRECO)
            VALUES (vNumero_nota, vProduto, vQuantidade, vPreco);
        END IF;
        SET vContador = vContador + 1;
    END WHILE;
END$$

DELIMITER ;
;

call p_inserir_venda('2024-03-11', 5, 2);