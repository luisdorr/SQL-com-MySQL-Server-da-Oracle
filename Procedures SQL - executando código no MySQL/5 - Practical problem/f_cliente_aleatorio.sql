USE `sucos_vendas`;
DROP function IF EXISTS `f_cliente_aleatorio`;

USE `sucos_vendas`;
DROP function IF EXISTS `sucos_vendas`.`f_cliente_aleatorio`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE vRetorno VARCHAR(11);
    DECLARE num_max_tabela INT;
    DECLARE numero_aleatorio_inteiro INT;

    SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_clientes;
    SET numero_aleatorio_inteiro = f_numero_aleatorio(1, num_max_tabela) - 1;

    SELECT CPF INTO vRetorno FROM tabela_de_clientes
    LIMIT numero_aleatorio_inteiro, 1;
RETURN vRetorno;
END$$

DELIMITER ;
;


