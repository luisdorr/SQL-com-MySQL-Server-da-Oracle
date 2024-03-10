USE `sucos_vendas`;
DROP procedure IF EXISTS `show_variable`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `show_variable` ()
BEGIN
declare text char(12) default 'Hello World!';
SELECT text;
END$$

DELIMITER ;

call show_variable;

#############################################################################################
USE `sucos_vendas`;
DROP procedure IF EXISTS `local_date_hour`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `local_date_hour` ()
BEGIN
declare ts datetime default localtimestamp();
select ts;
END$$

DELIMITER ;

call local_date_hour();


##########################################################################################
CREATE PROCEDURE `Exerc01`()

BEGIN

DECLARE Cliente VARCHAR(10);
DECLARE Idade INT;
DECLARE DataNascimento DATE;
DECLARE Custo FLOAT;

SET Cliente = 'João';
SET Idade = 10;
SET DataNascimento = '20170110';
SET Custo = 10.23;

SELECT Cliente;
SELECT Idade;
SELECT DataNascimento;
SELECT Custo;

END

##################################################################################################
USE `sucos_vendas`;
DROP procedure IF EXISTS `data_types`;

DELIMITER $$
USE `sucos_vendas`$$
CREATE PROCEDURE `data_types` ()
BEGIN
declare v varchar(5) default 'TEXT';
declare i integer default 10;
declare d decimal(4,2) default 56.12;
declare dt date default '2019-03-01';
#######################################
select v;
select i;
select d;
select dt;
END$$

DELIMITER ;