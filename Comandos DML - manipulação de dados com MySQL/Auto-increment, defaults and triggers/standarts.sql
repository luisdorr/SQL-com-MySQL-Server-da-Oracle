CREATE TABLE TAB_PADRAO
(
	ID INT AUTO_INCREMENT,
	DESCRIPTOR VARCHAR(20) NULL,#<-- PATTER
	CITY VARCHAR(50) DEFAULT 'RIO DE JANEIRO',#<-- PATTER
	CREATION_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP(), #<-- PATTER
	PRIMARY KEY(ID)
);
# In this case the Standards are NULL and DEFAULT(…) and they will be
# used if we don't fill in these fields in INSERT.