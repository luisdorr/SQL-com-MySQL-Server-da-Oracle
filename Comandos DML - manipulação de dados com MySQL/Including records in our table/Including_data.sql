USE vendas_sucos;

INSERT INTO  products(CODE, DESCRIPTOR, FLAVOUR, SIZE, PACKAGING, PRICE_LIST)
VALUES ('1040107', 'Light - 350ml - Melãncia', 'Melância', '350 ml', 'Lata', 4.56);

INSERT INTO  products(CODE, DESCRIPTOR, FLAVOUR, SIZE, PACKAGING, PRICE_LIST)
VALUES ('1040109', 'Light - 350ml - Açai', 'Açai', '350 ml', 'Lata', 5.60);

INSERT INTO  products
VALUES ('1040108', 'Light - 350ml - Laranja', 'Laranja', '350 ml', 'Lata', 5.60),
('1040110', 'Light - 350ml - Morango', 'Morango', '350 ml', 'Lata', 6.00);

SELECT * FROM products;

INSERT INTO CUSTOMER (CPF, NAME, ADDRESS, NEIGHBOURHOOD, CITY, STATE, POSTCODE, DATE_BORN, AGE, GENDER, CREDIT_LIMIT, VOLUME_PURCHASE, FIRST_PURCHASE)
VALUES
  ('1471156710', 'Érica Carvalho', 'R. Iriquitia', 'Jardins', 'São Paulo', 'SP', '80012212', '1990-09-01', 27, 'F', 170000, 24500, false),
  ('19290992743', 'Fernando Cavalcante', 'R. Dois de Fevereiro', 'Água Santa', 'Rio de Janeiro', 'RJ', '22000000', '2000-02-12', 18, 'M', 100000, 20000, true),
  ('2600586709', 'César Teixeira', 'Rua Conde de Bonfim', 'Tijuca', 'Rio de Janeiro', 'RJ', '22020001', '2000-03-12', 18, 'M', 120000, 22000, false);

SELECT * FROM customer;