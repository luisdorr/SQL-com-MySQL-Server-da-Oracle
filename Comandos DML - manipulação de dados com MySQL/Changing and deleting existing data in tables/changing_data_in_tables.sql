SELECT * FROM  products;

UPDATE  products SET PRICE_LIST = 5
WHERE CODE = '1000889';

UPDATE products SET PACKAGING = 'PET',
                    SIZE = '1 Litro',
                    DESCRIPTOR = 'Sabor da montamha - 1 Litro - Uva'
WHERE  CODE = '1000889';

UPDATE CUSTOMERS
SET ADDRESS = 'R. Jorge Emilio 23',
NEIGHBOURHOOD = 'Santo Amaro',
CITY = 'São Paulo',
STATE = 'SP',
CEP = '8833223'
WHERE CPF = '19290992743 ';