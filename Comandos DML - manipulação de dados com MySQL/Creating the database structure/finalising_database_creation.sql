USE vendas_sucos;

CREATE TABLE notes_items
(
    NUMBER VARCHAR(5) NOT NULL,
    CODE VARCHAR(10) NOT NULL,
    AMOUNT INT,
    PRICE FLOAT,
    PRIMARY KEY (NUMBER, CODE),
    CONSTRAINT 'FK_NOTES' FOREIGN KEY (NUMBER) REFERENCES notes (NUMBER),
    CONSTRAINT 'FK_PRODUCTS' FOREIGN KEY (CODE) REFERENCES products (CODE)
)