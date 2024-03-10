USE `sucos_vendas`;
DROP procedure IF EXISTS `do_nothing`;

DELIMITER $$
USE `sucos_vendas`$$
$$

DELIMITER ;

USE `sucos_vendas`;
DROP procedure IF EXISTS `hello_world`;

USE `sucos_vendas`;
DROP procedure IF EXISTS `hello_world`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `hello_world` ()
BEGIN
SELECT 'HELLOOOOO WOOOORLD!!!';
END$$

DELIMITER ;
