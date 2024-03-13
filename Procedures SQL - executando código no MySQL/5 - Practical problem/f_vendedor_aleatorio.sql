
USE `sucos_vendas`;
DROP function IF EXISTS `sucos_vendas`.`f_vendedor_aleatorio`;
;

DELIMITER $$
USE `sucos_vendas`$$
CREATE FUNCTION `f_vendedor_aleatorio`()
RETURNS varchar(5)
DETERMINISTIC
BEGIN
	DECLARE vRetorno VARCHAR(5);
	DECLARE num_max_tabela INT;
	DECLARE num_aleatorio INT;
	SELECT COUNT(*) INTO num_max_tabela FROM tabela_de_vendedores;
	SET num_aleatorio = f_numero_aleatorio(1, num_max_tabela);
	SET num_aleatorio = num_aleatorio - 1;
	SELECT MATRICULA INTO vRetorno FROM tabela_de_vendedores
	LIMIT num_aleatorio, 1;
	RETURN vRetorno;
END$$

DELIMITER ;
;
